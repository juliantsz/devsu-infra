variable "security_group_id" {
  type = string
  description = "Security Group ID"
}

variable "cidr_ipv4" {
  type = string
  description = "ip of the egress rule"
}

variable "ip_protocol" {
  type = string
  description = "Protocol"
}
