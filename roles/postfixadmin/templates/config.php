<?php
$CONF['configured'] = true;

$CONF['database_type'] = 'pgsql';
$CONF['database_host'] = '{{ pfa_db_login_host }}';
$CONF['database_port'] = '{{ pfa_db_login_port }}';
$CONF['database_user'] = '{{ pfa_db_user }}';
$CONF['database_password'] = '{{ pfa_db_password }}';
$CONF['database_name'] = '{{ pfa_db_name }}';

$CONF['default_aliases'] = array (
	'abuse' => 'abuse@{{ pfa_domain }}',
	'hostmaster' => 'hostmaster@{{ pfa_domain }}',
 	'postmaster' => 'postmaster@{{ pfa_domain }}',
	'webmaster' => 'webmaster@{{ pfa_domain }}'
);

$CONF['domain_in_mailbox'] = 'NO';
$CONF['domain_path'] = 'YES';

$CONF['encrypt'] = '{{ pfa_encrypt }}';

$CONF['admin_email'] = '{{ pfa_admin_email }}';
$CONF['admin_name'] = '{{ pfa_admin_name }}';

$CONF['smtp_server'] = '{{ pfa_smtp_server }}';
$CONF['smtp_port'] = '{{ pfa_smtp_port }}';
$CONF['smtp_client'] = '{{ pfa_smtp_client }}';

$CONF['generate_password'] = 'YES';

$CONF['backup'] = 'YES';

$CONF['recipient_delimiter'] = "+";

$CONF['show_footer_text'] = 'NO';

$CONF['used_quotas'] = 'YES';

{% if pfa_setup_password | d(false, true) %}$CONF['setup_password'] = '{{ pfa_setup_password }}';{% endif %}
?>
