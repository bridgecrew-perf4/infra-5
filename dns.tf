# DNS

resource "ovh_domain_zone_record" "apex" {
  zone      = "karolak.fr"
  fieldtype = "A"
  ttl       = "3600"
  target    = module.lb_instance.ipv4
}

resource "ovh_domain_zone_record" "caa_iodef" {
  zone      = "karolak.fr"
  fieldtype = "CAA"
  ttl       = "3600"
  target    = "0 iodef \"mailto:admin+caa@karolak.fr\""
}

resource "ovh_domain_zone_record" "caa_issue" {
  zone      = "karolak.fr"
  fieldtype = "CAA"
  ttl       = "3600"
  target    = "0 issue \"letsencrypt.org\""
}

resource "ovh_domain_zone_record" "dkim" {
  zone      = "karolak.fr"
  subdomain = "mail._domainkey"
  fieldtype = "TXT"
  ttl       = "600"
  target    = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDHNE49B2ZAJ7Qr3NSGXWeiAZKPJHkkJvXGlO94N+04Yz8RN5ScT7qPQrSiP/SwoisQ1HJ0D3gqwcS0mfmYLAevP9FFfzPURbdmyi9lHIW7uQSDdwzcRDLNl9kweU/aU7RHz7S85ebEP1Db/HgEuXhUPCaSzl5LOld6MFjzJ0Q+8QIDAQAB"
}

resource "ovh_domain_zone_record" "dmarc" {
  zone      = "karolak.fr"
  subdomain = "_dmarc"
  fieldtype = "TXT"
  ttl       = "600"
  target    = "v=DMARC1; p=none; adkim=r; aspf=r;"
}

resource "ovh_domain_zone_record" "home" {
  zone      = "karolak.fr"
  subdomain = "home"
  fieldtype = "A"
  ttl       = "3600"
  target    = "109.15.54.71"
}

resource "ovh_domain_zone_record" "mx" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "1 smtp.karolak.fr."
}

resource "ovh_domain_zone_record" "nas" {
  zone      = "karolak.fr"
  subdomain = "nas"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.home.subdomain
}

resource "ovh_domain_zone_record" "ns1" {
  zone      = "karolak.fr"
  fieldtype = "NS"
  ttl       = "3600"
  target    = "dns105.ovh.net."
}

resource "ovh_domain_zone_record" "ns2" {
  zone      = "karolak.fr"
  fieldtype = "NS"
  ttl       = "3600"
  target    = "ns105.ovh.net."
}

resource "ovh_domain_zone_record" "spf" {
  zone      = "karolak.fr"
  fieldtype = "TXT"
  ttl       = "600"
  target    = "v=spf1 mx include:spf.infomaniak.ch -all"
}

resource "ovh_domain_zone_record" "srv_imaps" {
  zone      = "karolak.fr"
  subdomain = "_imaps._tcp"
  fieldtype = "SRV"
  ttl       = 3600
  target    = "0 0 993 imap.karolak.fr."
}

resource "ovh_domain_zone_record" "srv_submission" {
  zone      = "karolak.fr"
  subdomain = "_submission._tcp"
  fieldtype = "SRV"
  ttl       = 3600
  target    = "0 0 587 smtp.karolak.fr."
}
