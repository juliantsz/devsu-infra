module "jtuberquia_certificate" {
  source = "../../../modules/certificate"

  domain                = var.jtuberquia_domain
  validation_method     = var.validation_method
  tags                  = var.jtuberquia_tags
}