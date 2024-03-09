// create the vpc, security group, route tables, nat gateway and route table association
module "vpc" {
    source = "../../modules/network/vpc"
    //source = "git::ssh://git@gitlab.com/route/to-repo.git//route/to/file?ref=master"

    environment           = var.environment
    vpc_cidr_block        = var.vpc_cidr_block
    azs                   = var.azs
    public_subnets_cidrs  = var.public_subnets_cidrs
    private_subnets_cidrs = var.private_subnets_cidrs
    public_subnets_tags   = var.public_subnets_tags
    private_subnets_tags  = var.private_subnets_tags
}

module "data_plane_security_group" {
  source     = "../../modules/network/security_group"
  depends_on = [module.vpc]

  name        = var.data_plane_security_group_name
  description = var.data_plane_security_group_description
  vpc_id      = module.vpc.vpc_id
}

module "data_plane_security_group_ingress_rule_0" {
  source     = "../../modules/network/security_group_ingress_rule"
  depends_on = [module.data_plane_security_group]

  security_group_id = module.data_plane_security_group.security_group_id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = var.data_plane_ingress_from_port_0
  ip_protocol       = var.data_plane_ingress_ip_protocol
  to_port           = var.data_plane_ingress_to_port
}

module "data_plane_security_group_ingress_rule_1025" {
  source     = "../../modules/network/security_group_ingress_rule"
  depends_on = [module.data_plane_security_group]

  security_group_id = module.data_plane_security_group.security_group_id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = var.data_plane_ingress_from_port_1025
  ip_protocol       = var.data_plane_ingress_ip_protocol
  to_port           = var.data_plane_ingress_to_port
}

module "data_plane_security_group_egress_rule" {
  source     = "../../modules/network/security_group_egress_rule"
  depends_on = [module.data_plane_security_group]

  security_group_id = module.data_plane_security_group.security_group_id
  cidr_ipv4         = var.data_plane_egress_cidr_ipv4
  ip_protocol       = var.data_plane_egress_ip_protocol
}

// create ecr repository
module "dev_repository" {
    source = "../../modules/ecr"

    name                 = var.dev_ecr_repo_name
    image_tag_mutability = var.image_tag_mutability
    tags                 = var.ecr_tags
}

module "stg_repository" {
    source = "../../modules/ecr"

    name                 = var.stg_ecr_repo_name
    image_tag_mutability = var.image_tag_mutability
    tags                 = var.ecr_tags
}

module "prod_repository" {
    source = "../../modules/ecr"

    name                 = var.prod_ecr_repo_name
    image_tag_mutability = var.image_tag_mutability
    tags                 = var.ecr_tags
}

locals {
  cluster_role_assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
            Effect: "Allow",
            Principal: {
                Service: "eks.amazonaws.com"
            },
            Action: "sts:AssumeRole"
            }
        ]
  })
  node_group_role_assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
        Effect: "Allow",
        Principal: {
            Service: "ec2.amazonaws.com"
        },
        Action: "sts:AssumeRole"
        }
    ]
    })
}

module "roles" {
    source = "../../modules/eks/iam"

    cluster_name                       = var.cluster_name
    cluster_role_assume_role_policy    = local.cluster_role_assume_role_policy
    node_group_role_assume_role_policy = local.node_group_role_assume_role_policy
}


// created the k8s cluster
module "cluster" {
    source     = "../../modules/eks/cluster"
    depends_on = [module.roles]

    cluster_name                           = var.cluster_name
    cluster_role_arn                       = module.roles.cluster_role_arn
    cluster_version                        = var.cluster_version
    security_group_ids                     = flatten([module.vpc.security_group_ids, module.data_plane_security_group.security_group_id])
    subnet_ids                             = flatten([module.vpc.public_subnet_ids, module.vpc.private_subnet_ids])
}

// created the node groups with node selector
module "shared_node_group" {
    source     = "../../modules/eks/node_group/simple"
    depends_on = [module.cluster]

    cluster_name         = var.cluster_name
    node_disk_size       = var.node_disk_size
    node_group_name      = var.shared_node_group_name
    node_role_arn        = module.roles.node_group_role_arn
    private_subnet_ids   = module.vpc.private_subnet_ids
    cluster_version      = var.cluster_version
    desired_size         = var.shared_node_group_desired_size
    max_size             = var.shared_node_group_max_size
    min_size             = var.shared_node_group_min_size
    ami_type             = var.arm_node_group_ami_type
    capacity_type        = var.node_group_capacity_type
    instance_types       = var.arm_node_group_instance_types
}

// add the addons to the cluster
module "addons" {
    source     = "../../modules/eks/addons"
    depends_on = [module.shared_node_group]

    cluster_name                           = var.cluster_name
    coredns_addon_version                  = var.coredns_addon_version
    coredns_resolve_conflicts_on_update    = var.coredns_resolve_conflicts_on_update
    vpc_cni_addon_version                  = var.vpc_cni_addon_version
    vpc_cni_resolve_conflicts_on_update    = var.vpc_cni_resolve_conflicts_on_update
    kube_proxy_addon_version               = var.kube_proxy_addon_version
    kube_proxy_resolve_conflicts_on_update = var.kube_proxy_resolve_conflicts_on_update
}
