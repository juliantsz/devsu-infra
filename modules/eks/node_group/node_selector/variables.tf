variable "cluster_name" {
  type        = string
  description = "Name of the Kuberentes Cluster"
}

variable "node_group_name" {
  type        = string
  description = "Name of the Kuberentes Node Group"
}

variable "node_role_arn" {
  type        = string
  description = "ARN of the Kuberentes Node Group"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of subnets"
}

variable "cluster_version" {
  type        = string
  description = "Version of the Kuberentes Cluster"
}

variable "launch_template_name" {
  type        = string
  description = "The name of the launch template"
}

variable "node_disk_size" {
  type        = number
  description = "Node disk size"
}

variable "node_selector" {
  type        = string
  description = "Name of the node selector to use"
}

variable "desired_size" {
  type        = number
  description = "Desired count for node groups"
}

variable "max_size" {
  type        = string
  description = "Max count for node groups"
}

variable "min_size" {
  type        = string
  description = "Min count for node groups"
}

variable "ami_type" {
  type        = string
  description = "Node ami type"
}

variable "capacity_type" {
  type        = string
  description = "Node capacity type"
}

variable "instance_types" {
  type        = list(string)
  description = "Node instance types"
}