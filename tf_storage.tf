# STORAGE

resource "scaleway_object_bucket" "nextcloud" {
  name = "karolak-nextcloud-data-bucket"
  acl  = "private"
}

resource "scaleway_object_bucket" "backup" {
  name = "karolak-backup-bucket"
  acl  = "private"
}
