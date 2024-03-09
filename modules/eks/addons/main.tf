resource "aws_eks_addon" "coredns" {
  cluster_name                = var.cluster_name
  addon_name                  = "coredns"
  addon_version               = var.coredns_addon_version
  resolve_conflicts_on_update = var.coredns_resolve_conflicts_on_update
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name                = var.cluster_name
  addon_name                  = "vpc-cni"
  addon_version               = var.vpc_cni_addon_version
  resolve_conflicts_on_update = var.vpc_cni_resolve_conflicts_on_update
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name                = var.cluster_name
  addon_name                  = "kube-proxy"
  addon_version               = var.kube_proxy_addon_version
  resolve_conflicts_on_update = var.kube_proxy_resolve_conflicts_on_update
}