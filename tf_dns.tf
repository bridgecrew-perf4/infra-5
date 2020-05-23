# DNS PUBLIC

resource "ovh_domain_zone_record" "apex" {
  zone      = "karolak.fr"
  fieldtype = "A"
  ttl       = "3600"
  target    = scaleway_instance_server.lb.public_ip
}

resource "ovh_domain_zone_record" "apex6" {
  zone      = "karolak.fr"
  fieldtype = "AAAA"
  ttl       = "3600"
  target    = scaleway_instance_server.lb.ipv6_address
}

resource "ovh_domain_zone_record" "bastion" {
  zone      = "karolak.fr"
  subdomain = "bastion"
  fieldtype = "A"
  ttl       = "3600"
  target    = scaleway_instance_server.bastion.public_ip
}

resource "ovh_domain_zone_record" "bastion6" {
  zone      = "karolak.fr"
  subdomain = "bastion"
  fieldtype = "AAAA"
  ttl       = "3600"
  target    = scaleway_instance_server.bastion.ipv6_address
}

resource "ovh_domain_zone_record" "bag" {
  zone      = "karolak.fr"
  subdomain = "bag"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}

resource "ovh_domain_zone_record" "blog" {
  zone      = "karolak.fr"
  subdomain = "blog"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
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

resource "ovh_domain_zone_record" "caa_issuewild" {
  zone      = "karolak.fr"
  fieldtype = "CAA"
  ttl       = "3600"
  target    = "0 issuewild \"letsencrypt.org\""
}

resource "ovh_domain_zone_record" "cloud" {
  zone      = "karolak.fr"
  subdomain = "cloud"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}

resource "ovh_domain_zone_record" "crypto" {
  zone      = "karolak.fr"
  subdomain = "crypto"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
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

resource "ovh_domain_zone_record" "git" {
  zone      = "karolak.fr"
  subdomain = "git"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}

resource "ovh_domain_zone_record" "home" {
  zone      = "karolak.fr"
  subdomain = "home"
  fieldtype = "A"
  ttl       = "3600"
  target    = "109.15.54.71"
}

resource "ovh_domain_zone_record" "imap" {
  zone      = "karolak.fr"
  subdomain = "imap"
  fieldtype = "A"
  ttl       = "3600"
  target    = module.imap_instance.ipv4
}

resource "ovh_domain_zone_record" "imap6" {
  zone      = "karolak.fr"
  subdomain = "imap"
  fieldtype = "AAAA"
  ttl       = "3600"
  target    = module.imap_instance.ipv6
}

resource "ovh_domain_zone_record" "lb" {
  zone      = "karolak.fr"
  subdomain = "lb"
  fieldtype = "A"
  ttl       = "3600"
  target    = scaleway_instance_server.lb.public_ip
}

resource "ovh_domain_zone_record" "lb6" {
  zone      = "karolak.fr"
  subdomain = "lb"
  fieldtype = "AAAA"
  ttl       = "3600"
  target    = scaleway_instance_server.lb.ipv6_address
}

resource "ovh_domain_zone_record" "mail" {
  zone      = "karolak.fr"
  subdomain = "mail"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.smtp.subdomain
}

resource "ovh_domain_zone_record" "mx" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "100 mta-gw.infomaniak.ch."
}

resource "ovh_domain_zone_record" "mx_mail" {
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

resource "ovh_domain_zone_record" "ndata" {
  zone      = "karolak.fr"
  subdomain = "ndata"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
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

resource "ovh_domain_zone_record" "postfixadmin" {
  zone      = "karolak.fr"
  subdomain = "pfa"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}

resource "ovh_domain_zone_record" "rspamd" {
  zone      = "karolak.fr"
  subdomain = "rspamd"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}

resource "ovh_domain_zone_record" "smtp" {
  zone      = "karolak.fr"
  subdomain = "smtp"
  fieldtype = "A"
  ttl       = "3600"
  target    = scaleway_instance_server.smtp.public_ip
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

resource "ovh_domain_zone_record" "tlsa_apex" {
  zone      = "karolak.fr"
  subdomain = "_443._tcp"
  fieldtype = "TLSA"
  ttl       = 3600
  target    = "0 0 1 25847d668eb4f04fdd40b12b6b0740c567da7d024308eb6c2c96fe41d9de218d"
}

resource "ovh_domain_zone_record" "tlsa_bag" {
  zone      = "karolak.fr"
  subdomain = "_443._tcp.bag"
  fieldtype = "TLSA"
  ttl       = 3600
  target    = "0 0 1 25847d668eb4f04fdd40b12b6b0740c567da7d024308eb6c2c96fe41d9de218d"
}

resource "ovh_domain_zone_record" "tlsa_blog" {
  zone      = "karolak.fr"
  subdomain = "_443._tcp.blog"
  fieldtype = "TLSA"
  ttl       = 3600
  target    = "0 0 1 25847d668eb4f04fdd40b12b6b0740c567da7d024308eb6c2c96fe41d9de218d"
}

resource "ovh_domain_zone_record" "tlsa_cloud" {
  zone      = "karolak.fr"
  subdomain = "_443._tcp.cloud"
  fieldtype = "TLSA"
  ttl       = 3600
  target    = "0 0 1 25847d668eb4f04fdd40b12b6b0740c567da7d024308eb6c2c96fe41d9de218d"
}

resource "ovh_domain_zone_record" "tlsa_imap" {
  zone      = "karolak.fr"
  subdomain = "_993._tcp.imap"
  fieldtype = "TLSA"
  ttl       = 3600
  target    = "0 0 1 25847d668eb4f04fdd40b12b6b0740c567da7d024308eb6c2c96fe41d9de218d"
}

resource "ovh_domain_zone_record" "tlsa_submission" {
  zone      = "karolak.fr"
  subdomain = "_587._tcp.smtp"
  fieldtype = "TLSA"
  ttl       = 3600
  target    = "0 0 1 25847d668eb4f04fdd40b12b6b0740c567da7d024308eb6c2c96fe41d9de218d"
}

resource "ovh_domain_zone_record" "wedding" {
  zone      = "karolak.fr"
  subdomain = "wedding"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}

resource "ovh_domain_zone_record" "www" {
  zone      = "karolak.fr"
  subdomain = "www"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = ovh_domain_zone_record.lb.subdomain
}
