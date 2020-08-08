"""pyinfra inventory."""

import io

hosts = [
    ('app.karolak.fr', {
        'grafana_config': io.StringIO(
            '[server]\n' +
            'domain = logs.karolak.fr\n' +
            'root_url = https://%(domain)s/\n' +
            '',
        ),
    }),
]
