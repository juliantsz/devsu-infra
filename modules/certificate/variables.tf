variable "domain" {
  type = string
  description = "Domain name for which the certificate should be issued"
}

variable "validation_method" {
  type = string
  description = "Which method to use for validation."
}

variable "tags" {
  type = map(string)
  description = "Tags for the resource"
}
