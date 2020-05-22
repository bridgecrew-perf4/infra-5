# DNS PRIVATE

resource "ovh_domain_zone_record" "bastion_priv" {
  zone      = "karolak.fr"
  subdomain = "bastion.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.bastion.private_ip
}

resource "ovh_domain_zone_record" "gitea_priv" {
  zone      = "karolak.fr"
  subdomain = "gitea.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.gitea.private_ip
}

resource "ovh_domain_zone_record" "imap_priv" {
  zone      = "karolak.fr"
  subdomain = "imap.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.imap.private_ip
}

resource "ovh_domain_zone_record" "lb_priv" {
  zone      = "karolak.fr"
  subdomain = "lb.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.lb.private_ip
}

resource "ovh_domain_zone_record" "mariadb_priv" {
  zone      = "karolak.fr"
  subdomain = "mariadb.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.mariadb.private_ip
}

resource "ovh_domain_zone_record" "nextcloud_priv" {
  zone      = "karolak.fr"
  subdomain = "nextcloud.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.nextcloud.private_ip
}

resource "ovh_domain_zone_record" "postgresql_priv" {
  zone      = "karolak.fr"
  subdomain = "postgresql.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.postgresql.private_ip
}

resource "ovh_domain_zone_record" "redis_priv" {
  zone      = "karolak.fr"
  subdomain = "redis.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.redis.private_ip
}

resource "ovh_domain_zone_record" "smtp_priv" {
  zone      = "karolak.fr"
  subdomain = "smtp.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.smtp.private_ip
}

resource "ovh_domain_zone_record" "wallabag_priv" {
  zone      = "karolak.fr"
  subdomain = "wallabag.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.wallabag.private_ip
}

resource "ovh_domain_zone_record" "web_priv" {
  zone      = "karolak.fr"
  subdomain = "web.priv"
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.web.private_ip
}
