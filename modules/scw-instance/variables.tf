variable "name" {
  description = "Resources name."
  type        = string
}

variable "instance_type" {
  description = "Server instance type."
  type        = string
  default     = "DEV1-S"
}

variable "instance_image" {
  description = "Server instance image."
  type        = string
  default     = "debian_buster"
}

variable "instance_ipv4_id" {
  description = "Enable server instance public IPv4 resource."
  type        = string
  default     = null
}

variable "instance_ipv4" {
  description = "Enable server instance public IPv4."
  type        = bool
  default     = true
}

variable "instance_ipv6" {
  description = "Enable server instance public IPv6."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to set on the resources."
  type        = list(string)
  default     = []
}

variable "dns_zone" {
  description = "Private DNS zone."
  type        = string
  default     = "karolak.fr"
}
