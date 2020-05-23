resource "scaleway_instance_ip" "ip" {}

resource "ovh_domain_zone_record" "ip" {
  zone      = var.zone
  subdomain = var.name
  fieldtype = "A"
  ttl       = "3600"
  target    = scaleway_instance_ip.ip.address
}

resource "scaleway_instance_ip_reverse_dns" "bastion" {
  ip_id   = scaleway_instance_ip.ip.id
  reverse = format("%s.%s", ovh_domain_zone_record.ip.subdomain, ovh_domain_zone_record.ip.zone)
}
