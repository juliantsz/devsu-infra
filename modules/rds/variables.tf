variable "cluster_identifier" {
    description = "The cluster identifier."
    type = string
}

variable "engine" {
    description = "Name of the database engine to be used for this DB cluster."
    type = string
}

variable "engine_mode" {
    description = "Database engine mode. "
    type = string
}

variable "engine_version" {
    description = "Database engine version."
    type = string
}

variable "database_name" {
    description = "Database name"
    type = string
}

variable "master_username" {
    description = "Master username"
    type = string
}

variable "master_password" {
    description = "Master password"
    type = string
}

variable "db_subnet_group_name" {
    description = "Subnet group name"
    type = string
}
