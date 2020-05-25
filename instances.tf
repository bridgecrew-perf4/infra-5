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
}

# PROVIDERS

provider "scaleway" {}

provider "ovh" {}

# INSTANCES

module "grocy_instance" {
  source = "./modules/scw-instance"
  name   = "grocy"
  tags   = ["private"]
}

module "lb_instance" {
  source  = "./modules/scw-instance"
  name    = "lb"
  type    = "START1-XS"
  tags    = ["public"]
  ipv4_id = module.lb_ip.id
}

module "nextcloud_instance" {
  source = "./modules/scw-instance"
  name   = "nextcloud"
  tags   = ["postgresql_server", "private", "redis"]
}

module "smtp_instance" {
  source  = "./modules/scw-instance"
  name    = "smtp"
  type    = "START1-XS"
  tags    = ["imap", "postgresql_server", "public", "redis", "rspamd"]
  ipv4_id = module.mail_ip.id
}

module "wallabag_instance" {
  source = "./modules/scw-instance"
  name   = "wallabag"
  tags   = ["postgresql_server", "private", "redis"]
}

module "web_instance" {
  source = "./modules/scw-instance"
  name   = "web"
  tags   = ["mariadb", "private", "redis"]
}
