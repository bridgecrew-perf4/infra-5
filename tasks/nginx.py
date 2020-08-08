"""Install and configure Nginx."""

from pyinfra import host
from pyinfra.operations import (
    apt,
    files,
    init,
)

nginx_main = host.data.nginx_main or ''
nginx_snippets = host.data.nginx_snippets or []
nginx_confs = host.data.nginx_confs or []
nginx_sites = host.data.nginx_sites or []
nginx_removes = host.data.nginx_removes or []

_nginx_restart = False

apt.packages(
    name='Install Nginx',
    update=True,
    cache_time=3600,
    no_recommends=True,
    packages=['nginx'],
)

if nginx_main:
    _nginx_main = files.template(
        name='Configure main',
        src='templates/nginx.conf.j2',
        dest='/etc/nginx/nginx.conf',
        nginx_main=nginx_main,
    )

    if _nginx_main.changed:
        _nginx_restart = True

for item in nginx_snippets:
    _nginx_snippet = files.template(
        name=f'Configure {item.name} snippet',
        src='templates/nginx_block.conf.j2',
        dest=f'/etc/nginx/snippets/{item.name}.conf',
        item=item,
    )
    if _nginx_snippet.changed:
        _nginx_restart = True

for item in nginx_confs:
    _nginx_conf = files.template(
        name=f'Configure {item.name} conf',
        src='templates/nginx_block.conf.j2',
        dest=f'/etc/nginx/conf.d/{item.name}.conf',
        item=item,
    )
    if _nginx_conf.changed:
        _nginx_restart = True

for item in nginx_sites:
    _nginx_site = files.template(
        name=f'Configure {item.name} site',
        src='templates/nginx_block.conf.j2',
        dest=f'/etc/nginx/site-available/{item.name}.conf',
        item=item,
    )
    _nginx_link = files.link(
        name=f'Enable {item.name} site',
        path=f'/etc/nginx/site-enabled/{item.name}.conf',
        target=f'/etc/nginx/site-available/{item.name}.conf',
    )
    if _nginx_site.changed:
        _nginx_restart = True

for item in nginx_removes:
    _nginx_remove = files.link(
        name=f'Enable {item.name} site',
        path=f'/etc/nginx/site-enabled/{item.name}.conf',
        target=f'/etc/nginx/site-available/{item.name}.conf',
    )
    if _nginx_remove.changed:
        _nginx_restart = True

init.systemd(
    name='Restart Nginx',
    service='nginx.service',
    restarted=_nginx_restart,
    enabled=True,
    running=True,
)
