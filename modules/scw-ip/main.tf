resource "scaleway_instance_ip" "ipv4" {}

resource "scaleway_instance_ip_reverse_dns" "a" {
  ip_id   = scaleway_instance_ip.ipv4.id
  reverse = format("%s.%s", var.name, var.zone)
}

resource "ovh_domain_zone_record" "cname" {
  for_each  = toset(var.aliases)
  zone      = var.zone
  subdomain = each.value
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = var.name
}
