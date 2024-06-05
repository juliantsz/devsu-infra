resource "aws_secretsmanager_secret" "secret" {
  name = var.name
}

resource "aws_secretsmanager_secret_version" "credentials" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode({"username": "${var.username}", "password": "${var.password}"})
}

output "secret_arn" {
  value = aws_secretsmanager_secret.secret.arn
}

output "secret_version_id" {
  value = aws_secretsmanager_secret_version.credentials.id
}

output "secret_version_string" {
  value = aws_secretsmanager_secret_version.credentials.secret_string
}