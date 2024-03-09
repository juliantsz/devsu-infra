locals {
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
		{
			Effect: "Allow",
			Action: [
				"acm:DescribeCertificate",
                "acm:ListCertificates",
                "acm:GetCertificate",
                "cloudwatch:*",
                "s3:*",
                "dynamodb:*",
                "application-autoscaling:*",
                "ec2:*",
                "ecs:*",
                "elasticloadbalancing:*",
                "route53:*",
                "logs:*",
                "ecr:*",
                "autoscaling:*"
			],
			Resource: "*"
		},
		{
			Effect: "Allow",
			Action: [
				"iam:PassRole"
			],
			Resource: [
                "arn:aws:iam::166472935010:role/aws-service-role/ecs.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_ECSService",
                "arn:aws:iam::166472935010:role/ECSExecutionRole"
            ]
		}
	]
  })
}

module "circleci_policy" {
  source = "../../../modules/iam/policy"

  name        = var.name
  description = var.description
  policy      = local.policy
}