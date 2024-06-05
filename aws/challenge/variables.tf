variable "kms_description" {
  type = string
  default = "Key for S3 encryption"
}

variable "kms_key_alias" {
  type = string
  default = "s3_key"
}

variable "bucket_name" {
  type = string
  default = "jtuberquia-bucket-challenge-01"
}

variable "secret_name" {
    default = "pgsecret"
    type = string
}

variable "username" {
    default = "pgadmin"
    type = string
}

variable "password" {
    type = string
}

variable "cluster_identifier" {
    default = "challenge"
    type = string
}

variable "engine" {
    default = "aurora-postgresql"
    type = string
}

variable "engine_mode" {
    default = "provisioned"
    type = string
}

variable "engine_version" {
    default = "15.4"
    type = string
}

variable "database_name" {
    default = "challenge"
    type = string
}

variable "db_subnet_group_name" {
    default = "private-sg"
    type = string
}