variable "name" {
  type = string
  description = "The name of the role"
}

variable "assume_role_policy" {
  type = string
  description = "Policy that grants an entity permission to assume the role."
}

variable "description" {
  type = string
  description = "Description of the IAM role."
}

variable "policy_arn" {
  type = string
  description = "ARN of the policy"
}