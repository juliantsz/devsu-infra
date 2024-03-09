resource "aws_iam_policy" "policy" {
  name        = var.name
  description = var.description
  policy      = var.policy
}

output "policy_arn" {
  value = aws_iam_policy.policy.name
}