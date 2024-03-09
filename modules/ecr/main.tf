resource "aws_ecr_repository" "repository" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  tags                 = var.tags
}