resource "aws_acm_certificate" "foo" {
  count = length(var.sub_domains)

  domain_name       = "foo.${var.sub_domains[count.index]}"
  validation_method = "DNS"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  tags = {
    Name        = "${local.env}-foo.${var.sub_domains[count.index]}"
    Environment = local.env
  }

  lifecycle {
    create_before_destroy = true
  }
}