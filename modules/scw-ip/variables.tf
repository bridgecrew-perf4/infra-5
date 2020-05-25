variable "name" {
  description = "Hostname used as DNS record and reverse IP name."
  type        = string
}

variable "zone" {
  description = "DNS zone name."
  type        = string
  default     = "karolak.fr"
}

variable "aliases" {
  description = "List of aliases linked to the hostname."
  type        = list(string)
  default     = []
}
