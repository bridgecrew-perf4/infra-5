"""Install Loki server."""

from pyinfra import host
from pyinfra.operations import (
    files,
    init,
    server,
)

loki_username = host.data.loki_username or 'loki'
loki_groupname = host.data.loki_groupname or 'loki'
loki_home = host.data.loki_home or f'/opt/{loki_username}'
loki_version = host.data.loki_version or '1.5.0'

server.group(
    name=f'Create {loki_groupname} group',
    group=loki_groupname,
    system=True,
)

server.user(
    name=f'Create {loki_username} user',
    user=loki_username,
    group=loki_groupname,
    home=loki_home,
    shell='/bin/bash',
    system=True,
)

_loki_download = files.download(
    name='Download loki',
    src=f'https://github.com/grafana/loki/releases/download/v{loki_version}/loki-linux-amd64.zip',
    dest=f'{loki_home}/loki-linux-amd64.zip',
    user=loki_username,
    group=loki_groupname,
)

if _loki_download.changed:
    server.shell(
        name='Extract loki',
        chdir=loki_home,
        commands=['unzip loki-linux-amd64.zip'],
        su_user=loki_username,
    )

files.download(
    name='Download default configuration',
    src=f'https://raw.githubusercontent.com/grafana/loki/v{loki_version}/cmd/loki/loki-local-config.yaml',
    dest=f'{loki_home}/loki-local-config.yaml',
    user=loki_username,
    group=loki_groupname,
)

_loki_service = files.template(
    name='Create loki service',
    src='templates/loki.service.j2',
    dest='/etc/systemd/system/loki.service',
    # vars
    loki_username=loki_username,
    loki_groupname=loki_groupname,
    loki_home=loki_home,
)

init.systemd(
    name='Enable loki service',
    service='loki.service',
    daemon_reload=_loki_service.changed,
    restarted=_loki_service.changed,
    enabled=True,
    running=True,
)
