resource "aws_kms_key" "key" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = aws_kms_key.key.id
}

output "kms_key_id" {
  value = aws_kms_key.key.id
}