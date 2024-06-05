variable "description" {
  description = "The description of the key as viewed in AWS console."
  type = string
}

variable "deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key."
  type = number
  default = 10
}

variable "kms_key_alias" {
  description = "The display name of the alias."
  type = string
}