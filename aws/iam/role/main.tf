locals {
  circleci_role_assume_policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
        {
          Effect: "Allow",
          Action: "sts:AssumeRoleWithWebIdentity",
            Principal: {
                Federated: "arn:aws:iam::166472935010:oidc-provider/oidc.circleci.com/org/157269f5-cb0b-43ee-8e14-ffb74022dbdb"
            },
            Condition: {
                StringEquals: {
                    "oidc.circleci.com/org/157269f5-cb0b-43ee-8e14-ffb74022dbdb:aud": [
                        "157269f5-cb0b-43ee-8e14-ffb74022dbdb"
                    ]
                }
            }
        }
    ]
  })
}

module "circleci_role" {
  source = "../../../modules/iam/role"

  name               = var.name
  description        = var.description
  assume_role_policy = local.circleci_role_assume_policy
  policy_arn         = var.policy_arn
}
