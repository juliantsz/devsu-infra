variable "cluster_name" {
  type = string
  description = "Name of the cluster"
}

variable "cluster_role_arn" {
  type = string
  description = "ARN of the IAM role that provides permissions for the Kubernetes control plane to make calls to AWS API operations on your behalf."
}

variable "cluster_version" {
  type = string
  description = "Desired Kubernetes master version"
}

variable "security_group_ids" {
  type = list(string)
  description = "List of security group IDs for the cross-account elastic network interfaces that Amazon EKS creates to use to allow communication between your worker nodes and the Kubernetes control plane."
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs."
}