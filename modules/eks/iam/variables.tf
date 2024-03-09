variable "cluster_role_assume_role_policy" {
  type = string
  description = "Cluster Role Assumed Policy"
}

variable "cluster_name" {
  type = string
  description = "Name of the Kuberentes Cluster"
}

variable "node_group_role_assume_role_policy" {
  type = string
  description = "Worker Role Assumed Policy"
}