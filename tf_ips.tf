# IP

resource "scaleway_instance_ip" "bastion" {}

resource "scaleway_instance_ip_reverse_dns" "bastion" {
  ip_id   = scaleway_instance_ip.bastion.id
  reverse = "bastion.karolak.fr"
}

resource "scaleway_instance_ip" "lb" {}

resource "scaleway_instance_ip_reverse_dns" "lb" {
  ip_id   = scaleway_instance_ip.lb.id
  reverse = "lb.karolak.fr"
}

resource "scaleway_instance_ip" "smtp" {}

resource "scaleway_instance_ip_reverse_dns" "smtp" {
  ip_id   = scaleway_instance_ip.smtp.id
  reverse = "smtp.karolak.fr"
}
