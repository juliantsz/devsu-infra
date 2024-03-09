variable "name" {
  type = string
  description = "Name of the security group."
}

variable "description" {
  type = string
  description = "Security group description."
}

variable "vpc_id" {
  type = string
  description = "VPC ID."
}
