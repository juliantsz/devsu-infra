variable "cluster_name" {
  type = string
  description = "Name of the kubernetes cluster"
}

variable "coredns_addon_version" {
 type = string
 description = "The version of the EKS add-on"
}

variable "coredns_resolve_conflicts_on_update" {
 type = string
 description = "How to resolve field value conflicts for an Amazon EKS add-on if you've changed a value from the Amazon EKS default value"
}

variable "vpc_cni_addon_version" {
 type = string
 description = "The version of the EKS add-on"
}

variable "vpc_cni_resolve_conflicts_on_update" {
 type = string
 description = "How to resolve field value conflicts for an Amazon EKS add-on if you've changed a value from the Amazon EKS default value"
}

variable "kube_proxy_addon_version" {
 type = string
 description = "The version of the EKS add-on"
}

variable "kube_proxy_resolve_conflicts_on_update" {
 type = string
 description = "How to resolve field value conflicts for an Amazon EKS add-on if you've changed a value from the Amazon EKS default value"
}