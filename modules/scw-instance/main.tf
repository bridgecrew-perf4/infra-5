resource "scaleway_instance_server" "server" {
  name  = var.name
  type  = var.type
  image = var.image
  tags  = var.tags

  ip_id             = var.ipv4_id == "" ? null : var.ipv4_id
  enable_dynamic_ip = var.ipv4 ? true : false
  enable_ipv6       = var.ipv6 ? true : false
}

resource "ovh_domain_zone_record" "pub" {
  zone      = var.zone
  subdomain = format("%s.pub", var.name)
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.server.public_ip
}

resource "ovh_domain_zone_record" "priv" {
  zone      = var.zone
  subdomain = format("%s.priv", var.name)
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.server.private_ip
}
