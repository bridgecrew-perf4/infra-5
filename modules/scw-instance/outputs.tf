output "ipv4" {
  description = "Server instance IPv4."
  value       = scaleway_instance_server.server.public_ip
}

output "ipv6" {
  description = "Server instance IPv6."
  value       = scaleway_instance_server.server.ipv6_address
}
