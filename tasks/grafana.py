"""Install Grafana from repositories."""

import io

from pyinfra import host
from pyinfra.operations import (
    apt,
    files,
    init,
)

grafana_config = host.data.grafana_config or io.StringIO('[server]\ndomain = localhost\n')

apt.key(
    name='Add Grafana repository key',
    src='https://packages.grafana.com/gpg.key',
)

_grafana_repo = apt.repo(
    name='Add Grafana repository',
    src='deb https://packages.grafana.com/oss/deb stable main',
    filename='grafana',
)

_grafana_install = apt.packages(
    name='Install Grafana',
    update=_grafana_repo.changed,
    cache_time=3600,
    packages='grafana',
    no_recommends=True,
)

_grafana_config = files.put(
    name='Configure Grafana',
    src=grafana_config,
    dest='/etc/grafana/grafana.ini',
    group='grafana',
    mode='640'
)

init.systemd(
    name='Enable Grafana service',
    service='grafana-server.service',
    daemon_reload=_grafana_install.changed,
    restarted=_grafana_install.changed or _grafana_config.changed,
    enabled=True,
    running=True,
)
