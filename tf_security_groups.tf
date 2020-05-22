# SECURITY GROUPS

resource "scaleway_instance_security_group" "bastion" {
  name = "bastion"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = "109.15.54.71"
  }

  inbound_rule {
    action   = "accept"
    port     = 3128
    ip_range = "10.0.0.0/8"
  }

  inbound_rule {
    action   = "accept"
    port     = 19999
    ip_range = "10.0.0.0/8"
  }

  inbound_rule {
    action   = "accept"
    protocol = "UDP"
    port     = 51820
    ip_range = "10.0.0.0/8"
  }
}

resource "scaleway_instance_security_group" "gitea" {
  name = "gitea"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 3000
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "imap" {
  name = "imap"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 24
    ip     = scaleway_instance_server.smtp.private_ip
  }

  inbound_rule {
    action   = "accept"
    port     = 993
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 993
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 1993
    ip     = scaleway_instance_server.smtp.private_ip
  }

  inbound_rule {
    action   = "accept"
    port     = 4190
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 4190
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "lb" {
  name = "lb"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 222
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action   = "accept"
    port     = 22
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 22
    ip_range = "::/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 80
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 80
    ip_range = "::/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 443
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 443
    ip_range = "::/0"
  }
}

resource "scaleway_instance_security_group" "mariadb" {
  name = "mariadb"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 3306
    ip     = scaleway_instance_server.web.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "nextcloud" {
  name = "nextcloud"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 80
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "postgresql" {
  name = "postgresql"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 5432
    ip     = scaleway_instance_server.gitea.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 5432
    ip     = scaleway_instance_server.imap.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 5432
    ip     = scaleway_instance_server.nextcloud.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 5432
    ip     = scaleway_instance_server.smtp.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 5432
    ip     = scaleway_instance_server.wallabag.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "redis" {
  name = "redis"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 6379
    ip     = scaleway_instance_server.gitea.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 6379
    ip     = scaleway_instance_server.nextcloud.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 6379
    ip     = scaleway_instance_server.smtp.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 6379
    ip     = scaleway_instance_server.wallabag.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 6379
    ip     = scaleway_instance_server.web.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "smtp" {
  name = "smtp"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action   = "accept"
    port     = 25
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 25
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 80
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action   = "accept"
    port     = 587
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    port     = 587
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 11334
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "wallabag" {
  name = "wallabag"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 80
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}

resource "scaleway_instance_security_group" "web" {
  name = "web"

  inbound_default_policy = "drop"

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "0.0.0.0/0"
  }

  inbound_rule {
    action   = "accept"
    protocol = "ICMP"
    ip_range = "::/0"
  }

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = scaleway_instance_server.bastion.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 80
    ip     = scaleway_instance_server.lb.private_ip
  }

  inbound_rule {
    action = "accept"
    port   = 19999
    ip     = scaleway_instance_server.lb.private_ip
  }
}
