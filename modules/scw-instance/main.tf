terraform {
  required_providers {
    ovh = {
      source  = "terraform-providers/ovh"
      version = "~> 0.8.0"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 1.16.0"
    }
  }

  required_version = ">= 0.13"
}

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
  subdomain = var.name
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

resource "ovh_domain_zone_record" "spf" {
  zone      = var.zone
  subdomain = var.name
  fieldtype = "TXT"
  ttl       = "600"
  target    = "v=spf1 mx a ~all"
}
