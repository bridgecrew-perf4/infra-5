output "address" {
  description = "IP address."
  value       = scaleway_instance_ip.ip.address
}

output "reverse" {
  description = "Reverse IP name."
  value       = scaleway_instance_ip.ip.reverse
}
