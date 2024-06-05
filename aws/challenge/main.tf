module "kms" {
  source = "../../modules/kms"

  description   = var.kms_description
  kms_key_alias = var.kms_key_alias
}

module "s3" {
  source = "../../modules/s3"

  bucket_name       = var.bucket_name
  kms_master_key_id = module.kms.kms_key_id
}

module "secret" {
  source = "../../modules/secret"

  name     = var.bucket_name
  username = var.username
  password = var.password
}

locals {
  pgadmin_credentials = jsondecode(module.secret.secret_version_string)
}

module "rds" {
  source = "../../modules/rds"

  depends_on = [ module.secret ]

  cluster_identifier   = var.cluster_identifier
  engine               = var.engine
  engine_mode          = var.engine_mode
  engine_version       = var.engine_version
  database_name        = var.database_name
  master_username      = local.pgadmin_credentials.username
  master_password      = local.pgadmin_credentials.password
  db_subnet_group_name = var.db_subnet_group_name 
}