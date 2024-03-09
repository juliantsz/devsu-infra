resource "aws_acm_certificate" "certificate" {
  domain_name       = var.domain
  validation_method = var.validation_method
  tags = var.tags
  lifecycle {
    create_before_destroy = true
  }
}