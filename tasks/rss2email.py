from pyinfra.operations import (
    apt,
    files,
    init,
    pip,
    server,
)

r2e_version = '3.11'
r2e_username = 'rss2email'
r2e_groupname = 'rss2email'
r2e_virtualenv = '/usr/local/venv/rss2email'
r2e_when = 'hourly'

server.group(
    {f'Create {r2e_groupname} group'},
    name=r2e_groupname,
    system=True,
)

server.user(
    {f'Create {r2e_username} user'},
    name=r2e_username,
    group=r2e_groupname,
    home=f'/home/{r2e_username}',
    shell='/usr/sbin/nologin',
    system=True,
)

apt.packages(
    {'Install python3 requirements'},
    packages=['virtualenv'],
    no_recommends=True,
)

pip.packages(
    {'Install rss2email'},
    packages=[f'rss2email=={r2e_version}'],
    virtualenv=r2e_virtualenv,
    virtualenv_kwargs={'python': 'python3'},
)

files.template(
    {'Create rss2email service'},
    template_filename='templates/rss2email.service.j2',
    remote_filename='/etc/systemd/system/rss2email.service',
    r2e_groupname=r2e_groupname,
    r2e_username=r2e_username,
    r2e_virtualenv=r2e_virtualenv,
)

files.template(
    {'Create rss2email timer'},
    template_filename='templates/rss2email.timer.j2',
    remote_filename='/etc/systemd/system/rss2email.timer',
    r2e_when=r2e_when,
)

init.systemd(
    {'Enable rss2email timer'},
    name='rss2email.timer',
    daemon_reload=True,
    enabled=True,
    running=True,
)
