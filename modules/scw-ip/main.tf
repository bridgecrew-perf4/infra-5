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
