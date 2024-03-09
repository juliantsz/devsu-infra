# Cluster Role
resource "aws_iam_role" "cluster_role" {
  name               = "${var.cluster_name}-role"
  assume_role_policy = var.cluster_role_assume_role_policy
}

resource "aws_iam_role_policy_attachment" "cluster_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}

output "cluster_role_arn" {
  value = aws_iam_role.cluster_role.arn
}

# Node Group Role
resource "aws_iam_role" "node_group_role" {
  name               = "${var.cluster_name}-worker-role"
  assume_role_policy = var.node_group_role_assume_role_policy
}

resource "aws_iam_role_policy_attachment" "node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "node_EC2InstanceProfileForImageBuilderECRContainerBuilds" {
  policy_arn = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "node_AmazonRoute53FullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "node_ElasticLoadBalancingFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
  role       = aws_iam_role.node_group_role.name
}

resource "aws_iam_role_policy_attachment" "node_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.node_group_role.name
}

/*resource "aws_key_pair" "clusterkey" {
  key_name   = "clusterkey-${var.cluster_name}"
  public_key = file("~/.ssh/id_rsa.pub")
}

output "key_name" {
  value = aws_key_pair.clusterkey.key_name
}*/

output "node_group_role_arn" {
  value = aws_iam_role.node_group_role.arn
}