resource "scaleway_instance_server" "server" {
  name  = var.name
  type  = var.instance_type
  image = var.instance_image
  tags  = var.tags

  ip_id             = var.instance_ipv4_id == "" ? null : var.instance_ipv4_id
  enable_dynamic_ip = var.instance_ipv4 ? true : false
  enable_ipv6       = var.instance_ipv6 ? true : false
}

resource "ovh_domain_zone_record" "priv" {
  zone      = var.dns_zone
  subdomain = format("%s.priv", var.name)
  fieldtype = "A"
  ttl       = "60"
  target    = scaleway_instance_server.server.private_ip
}
