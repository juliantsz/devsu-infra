// VPC VARIABLES
variable "environment" {
  type = string
  default = "devsu-dev"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
}

variable "private_subnets_cidrs" {
  type    = list(string)
  default = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/19"]
}

variable "public_subnets_tags" {
  type = map(string)
  default = {
     Name                                 = "devsu-dev PublicSubnet"
    "kubernetes.io/role/elb"              = 1
    "kubernetes.io/cluster/devsu-cluster" = "shared"
  }
}

variable "private_subnets_tags" {
  type = map(string)
  default = {
     Name                                 = "devsu-dev PrivateSubnet"
    "kubernetes.io/role/internal-elb"     = 1
    "kubernetes.io/cluster/devsu-cluster" = "shared"
  }
}

variable "azs" {
 type    = list(string)
 default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "data_plane_security_group_name" {
  type    = string
  default = "Data Plane SG"
}

variable "data_plane_security_group_description" {
  type    = string
  default = "Kubernetes Data Plane Security Group"
}

variable "data_plane_ingress_from_port_0" {
  type    = number
  default = 0
}

variable "data_plane_ingress_from_port_1025" {
  type    = number
  default = 1025
}

variable "data_plane_ingress_ip_protocol" {
  type    = string
  default = "tcp"
}

variable "data_plane_ingress_to_port" {
  type    = number
  default = 65535
}

variable "data_plane_egress_cidr_ipv4" {
  type = string
  default = "0.0.0.0/0"
}

variable "data_plane_egress_ip_protocol" {
  type = string
  default = "-1"
}

// ECR
variable "image_tag_mutability" {
  type = string
  default = "IMMUTABLE"
}

variable "dev_ecr_repo_name" {
  type = string
  default = "devsu-dev"
}

variable "stg_ecr_repo_name" {
  type = string
  default = "devsu-stg"
}

variable "prod_ecr_repo_name" {
  type = string
  default = "devsu-prod"
}

variable "ecr_tags" {
  type = map(string)
  default = {
    "Name" = "devsu"
  }
}

// EKS
variable "cluster_name" {
  type        = string
  default     = "devsu-cluster"
}

variable "cluster_version" {
  type    = string
  default = "1.29"
}

variable "coredns_addon_version" {
 type    = string
 default = "v1.11.1-eksbuild.4"
}

variable "coredns_resolve_conflicts_on_update" {
 type    = string
 default = "PRESERVE"
}

variable "vpc_cni_addon_version" {
 type    = string
 default = "v1.16.0-eksbuild.1"
}

variable "vpc_cni_resolve_conflicts_on_update" {
 type    = string
 default = "PRESERVE"
}

variable "kube_proxy_addon_version" {
 type    = string
 default = "v1.29.0-eksbuild.1"
}

variable "kube_proxy_resolve_conflicts_on_update" {
 type    = string
 default = "PRESERVE"
}

variable "node_disk_size" {
  type    = number
  default = 20
}

variable "arm_node_group_ami_type" {
  type    = string
  default = "AL2_x86_64"
}

variable "node_group_capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "arm_node_group_instance_types" {
  type    = list(string)
  default = ["t3a.large"]
}

## SHARED NODE GROUP ##

variable "shared_node_group_name" {
  type = string
  default = "shared-node-group"
}

variable "shared_node_group_desired_size" {
  type    = number
  default = 1
}

variable "shared_node_group_max_size" {
  type    = number
  default = 2
}

variable "shared_node_group_min_size" {
  type    = number
  default = 1
}

## END SHARED NODE GROUP ##