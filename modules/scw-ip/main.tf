resource "scaleway_instance_ip" "ipv4" {}

resource "ovh_domain_zone_record" "a" {
  zone      = var.zone
  subdomain = var.name
  fieldtype = "A"
  ttl       = "3600"
  target    = scaleway_instance_ip.ipv4.address
}

resource "scaleway_instance_ip_reverse_dns" "a" {
  ip_id   = scaleway_instance_ip.ipv4.id
  reverse = format("%s.%s", ovh_domain_zone_record.a.subdomain, ovh_domain_zone_record.a.zone)
}

resource "ovh_domain_zone_record" "cname" {
  for_each  = toset(var.aliases)
  zone      = var.zone
  subdomain = each.value
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.a.subdomain
}
