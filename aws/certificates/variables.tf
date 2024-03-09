variable "validation_method" {
  type = string
  default = "DNS"
}

variable "jtuberquia_domain" {
  type = string
  default = "*.jtuberquia.com"
}

variable "jtuberquia_tags" {
  type = map(string)
  default = {
    Name   = "jtuberquia-certificate"
    Domain = "jtuberquia"
  }
}