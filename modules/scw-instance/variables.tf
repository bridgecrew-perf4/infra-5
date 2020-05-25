variable "name" {
  description = "Resources name."
  type        = string
}

variable "type" {
  description = "Server instance type."
  type        = string
  default     = "DEV1-S"
}

variable "image" {
  description = "Server instance image."
  type        = string
  default     = "debian_buster"
}

variable "ipv4_id" {
  description = "Enable server instance public IPv4 resource."
  type        = string
  default     = null
}

variable "ipv4" {
  description = "Enable server instance public IPv4."
  type        = bool
  default     = true
}

variable "ipv6" {
  description = "Enable server instance public IPv6."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to set on the resources."
  type        = list(string)
  default     = []
}

variable "zone" {
  description = "Private DNS zone."
  type        = string
  default     = "karolak.fr"
}
