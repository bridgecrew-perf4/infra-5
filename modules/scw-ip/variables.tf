variable "name" {
  description = "Reverse DNS name."
  type        = string
}

variable "zone" {
  description = "Reverse DNS zone name."
  type        = string
  default     = "karolak.fr"
}
