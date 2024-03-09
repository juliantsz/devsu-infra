resource "aws_eks_node_group" "node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.node_group_name}-${var.cluster_name}"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids
  version         = var.cluster_version

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  ami_type       = var.ami_type
  capacity_type  = var.capacity_type
  instance_types = var.instance_types

  tags = {
    "eks/cluster-name"                              = var.cluster_name
    "eks/nodegroup-name"                            = "${var.node_group_name}-var.cluster_name"
    "eks/nodegroup-type"                            = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name"   = var.cluster_name
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
    "k8s.io/cluster-autoscaler/enabled"             = "TRUE"
  }
}