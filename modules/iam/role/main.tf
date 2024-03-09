resource "aws_iam_role" "role" {
  name        = var.name
  assume_role_policy = var.assume_role_policy
  description = var.description
}

resource "aws_iam_role_policy_attachment" "attachment" {
  policy_arn = var.policy_arn
  role       = aws_iam_role.role.name
}

output "role_arn" {
  value = aws_iam_role.role.name
}