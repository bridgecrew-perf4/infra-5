# BACKEND

terraform {
  backend "s3" {
    endpoint                    = "https://s3.fr-par.scw.cloud"
    region                      = "fr-par"
    bucket                      = "karolak-tfstate-bucket"
    key                         = "infra.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }

  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.9.1"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 1.17.0"
    }
  }

  required_version = ">= 0.13"
}

# DNS

resource "ovh_domain_zone_record" "apex" {
  zone      = "karolak.fr"
  fieldtype = "A"
  ttl       = "3600"
  target    = "109.15.68.39"
}

resource "ovh_domain_zone_record" "blog" {
  zone      = "karolak.fr"
  subdomain = "blog"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "blog-nicolas-karolak.netlify.app."
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

resource "ovh_domain_zone_record" "crypto" {
  zone      = "karolak.fr"
  subdomain = "crypto"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "crypto-assr.netlify.app."
}

resource "ovh_domain_zone_record" "cv" {
  zone      = "karolak.fr"
  subdomain = "cv"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "cv-nicolas-karolak.netlify.app."
}

resource "ovh_domain_zone_record" "dkim" {
  zone      = "karolak.fr"
  subdomain = "google._domainkey"
  fieldtype = "TXT"
  ttl       = "3600"
  target    = "v=DKIM1;k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCUxIztxYsaYDBVZAN3yPSy3FOsevD9vNOMonSMq3lnVRtDTpHMw85rODv3GVTi3gdodxGtre2LzBfQea5mRomHU9PRwWpaQVa/PGjd3xn8W7fC5H7PB7tHKoF2LowIKwTuaz8GxdM7nUd1Q3DkY83bjWuVVXwPKB+fYLIDSreJKQIDAQAB;"
}

resource "ovh_domain_zone_record" "dmarc" {
  zone      = "karolak.fr"
  subdomain = "_dmarc"
  fieldtype = "TXT"
  ttl       = "600"
  target    = "v=DMARC1; p=reject; rua=mailto:e854197a@in.mailhardener.com"
}

resource "ovh_domain_zone_record" "google-site-verification" {
  zone      = "karolak.fr"
  fieldtype = "TXT"
  ttl       = "86400"
  target    = "google-site-verification=WOLwTVshv5wO7mPyGYHm9OfpQXGJ7Y2Gy14-qN-cqRs"
}

resource "ovh_domain_zone_record" "home" {
  zone      = "karolak.fr"
  subdomain = "home"
  fieldtype = "A"
  ttl       = "3600"
  target    = "109.15.68.39"
}

resource "ovh_domain_zone_record" "keybase-site-verification" {
  zone      = "karolak.fr"
  fieldtype = "TXT"
  ttl       = "86400"
  target    = "keybase-site-verification=gYMxVcdl5X7nqzWlfPUuAxo4ynETWUg-yRyK8UkT_yI"
}

resource "ovh_domain_zone_record" "mta-sts_cname" {
  zone      = "karolak.fr"
  subdomain = "mta-sts"
  fieldtype = "CNAME"
  ttl       = "3600"
  target    = "mta-sts-karolak.netlify.app."
}

resource "ovh_domain_zone_record" "mta-sts_txt" {
  zone      = "karolak.fr"
  subdomain = "_mta-sts"
  fieldtype = "TXT"
  ttl       = "300"
  target    = "v=STSv1; id=202009160739"
}

resource "ovh_domain_zone_record" "mx_google" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "1 aspmx.l.google.com."
}

resource "ovh_domain_zone_record" "mx_google_alt1" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "5 alt1.aspmx.l.google.com."
}

resource "ovh_domain_zone_record" "mx_google_alt2" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "5 alt2.aspmx.l.google.com."
}

resource "ovh_domain_zone_record" "mx_google_alt3" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "10 alt3.aspmx.l.google.com."
}

resource "ovh_domain_zone_record" "mx_google_alt4" {
  zone      = "karolak.fr"
  fieldtype = "MX"
  ttl       = "3600"
  target    = "10 alt4.aspmx.l.google.com."
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
  target    = "v=spf1 include:_spf.google.com -all"
}

resource "ovh_domain_zone_record" "srv_imaps" {
  zone      = "karolak.fr"
  subdomain = "_imaps._tcp"
  fieldtype = "SRV"
  ttl       = 3600
  target    = "0 1 993 imap.gmail.com."
}

resource "ovh_domain_zone_record" "srv_submission" {
  zone      = "karolak.fr"
  subdomain = "_submissions._tcp"
  fieldtype = "SRV"
  ttl       = 3600
  target    = "0 1 465 smtp.gmail.com."
}

resource "ovh_domain_zone_record" "tls-rpt" {
  zone      = "karolak.fr"
  subdomain = "_smtp._tls"
  fieldtype = "TXT"
  ttl       = 600
  target    = "v=TLSRPTv1; rua=mailto:tlsrpt@in.mailhardener.com"
}
