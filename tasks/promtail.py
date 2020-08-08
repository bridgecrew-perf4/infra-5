"""Install Promtail agent."""

from pyinfra import host
from pyinfra.operations import (
    files,
    init,
    server,
)

promtail_username = host.data.promtail_username or 'promtail'
promtail_groupname = host.data.promtail_groupname or 'promtail'
promtail_home = host.data.promtail_home or f'/opt/{promtail_username}'
promtail_version = host.data.promtail_version or '1.5.0'

server.group(
    name=f'Create {promtail_groupname} group',
    group=promtail_groupname,
    system=True,
)

server.user(
    name=f'Create {promtail_username} user',
    user=promtail_username,
    group=promtail_groupname,
    groups=['adm'],
    home=promtail_home,
    shell='/bin/bash',
    system=True,
)

_promtail_download = files.download(
    name='Download promtail',
    src=f'https://github.com/grafana/loki/releases/download/v{promtail_version}/promtail-linux-amd64.zip',
    dest=f'{promtail_home}/promtail-linux-amd64.zip',
    user=promtail_username,
    group=promtail_groupname,
)

if _promtail_download.changed:
    server.shell(
        name='Extract promtail',
        chdir=promtail_home,
        commands=['unzip promtail-linux-amd64.zip'],
        su_user=promtail_username,
    )

files.download(
    name='Download default configuration',
    src=f'https://raw.githubusercontent.com/grafana/loki/v{promtail_version}/cmd/promtail/promtail-local-config.yaml',
    dest=f'{promtail_home}/promtail-local-config.yaml',
    user=promtail_username,
    group=promtail_groupname,
)

_promtail_service = files.template(
    name='Create promtail service',
    src='templates/promtail.service.j2',
    dest='/etc/systemd/system/promtail.service',
    # vars
    promtail_username=promtail_username,
    promtail_groupname=promtail_groupname,
    promtail_home=promtail_home,
)

init.systemd(
    name='Enable promtail service',
    service='promtail.service',
    daemon_reload=_promtail_service.changed,
    restarted=_promtail_service.changed,
    enabled=True,
    running=True,
)
