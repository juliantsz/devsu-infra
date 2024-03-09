resource "aws_eks_cluster" "cluster" {
  name                      = var.cluster_name
  role_arn                  = var.cluster_role_arn
  version                   = var.cluster_version

  vpc_config {
    security_group_ids      = var.security_group_ids
    subnet_ids              = var.subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}"
  }
}

output "cluster_arn" {
  value = aws_eks_cluster.cluster.arn
}

output "cluster_endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}