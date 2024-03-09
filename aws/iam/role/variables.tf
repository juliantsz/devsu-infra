variable "name" {
  type = string
  default = "circleci_role"
}

variable "description" {
  type = string
  default = "circle ci role"
}

variable "policy_arn" {
  type = string
  default = "arn:aws:iam::166472935010:policy/circleci_policy"
}