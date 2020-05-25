output "id" {
  description = "IP resource ID."
  value       = scaleway_instance_ip.ipv4.id
}

output "address" {
  description = "IP address."
  value       = scaleway_instance_ip.ipv4.address
}

output "name" {
  description = "Host name."
  value       = var.name
}

output "zone" {
  description = "DNS zone name."
  value       = var.zone
}
