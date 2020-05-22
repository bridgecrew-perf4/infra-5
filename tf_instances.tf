# INSTANCES

resource "scaleway_instance_server" "bastion" {
  name  = "bastion"
  type  = "DEV1-S"
  image = "debian_buster"
  tags  = ["public"]

  ip_id       = scaleway_instance_ip.bastion.id
  enable_ipv6 = true

  security_group_id = scaleway_instance_security_group.bastion.id
}

resource "scaleway_instance_server" "gitea" {
  name  = "gitea"
  type  = "START1-XS"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.gitea.id
}

resource "scaleway_instance_server" "imap" {
  name  = "imap"
  type  = "DEV1-S"
  image = "debian_buster"
  tags  = ["public"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.imap.id
}

resource "scaleway_instance_server" "lb" {
  name  = "lb"
  type  = "START1-XS"
  image = "debian_buster"
  tags  = ["public"]

  ip_id       = scaleway_instance_ip.lb.id
  enable_ipv6 = true

  security_group_id = scaleway_instance_security_group.lb.id
}

resource "scaleway_instance_server" "mariadb" {
  name  = "mariadb"
  type  = "START1-XS"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.mariadb.id
}

resource "scaleway_instance_server" "nextcloud" {
  name  = "nextcloud"
  type  = "DEV1-S"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.nextcloud.id
}

resource "scaleway_instance_server" "postgresql" {
  name  = "postgresql"
  type  = "START1-XS"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.postgresql.id
}

resource "scaleway_instance_server" "redis" {
  name  = "redis"
  type  = "START1-XS"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.redis.id
}

resource "scaleway_instance_server" "smtp" {
  name  = "smtp"
  type  = "START1-XS"
  image = "debian_buster"
  tags  = ["rspamd", "public"]

  ip_id       = scaleway_instance_ip.smtp.id
  enable_ipv6 = false

  security_group_id = scaleway_instance_security_group.smtp.id
}

resource "scaleway_instance_server" "wallabag" {
  name  = "wallabag"
  type  = "DEV1-S"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.wallabag.id
}

resource "scaleway_instance_server" "web" {
  name  = "web"
  type  = "DEV1-S"
  image = "debian_buster"
  tags  = ["private"]

  enable_dynamic_ip = true
  enable_ipv6       = true

  security_group_id = scaleway_instance_security_group.nextcloud.id
}
