variable "security_group_id" {
  type = string
  description = "Security Group ID"
}

variable "cidr_ipv4" {
  type = string
  description = "ip of the ingress rule"
}

variable "from_port" {
  type = number
  description = "Start port"
}

variable "ip_protocol" {
  type = string
  description = "Protocol"
}

variable "to_port" {
  type = number
  description = "End range port"
}