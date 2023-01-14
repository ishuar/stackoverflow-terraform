resource "aws_route53_zone" "public" {
  name = "foo.com"
}

resource "aws_route53_record" "foo" {
  for_each = { for domain in local.flatten_acm_object : domain.domain_name => domain }

  allow_overwrite = true
  name            = each.value.resource_record_name
  records         = [each.value.resource_record_value]
  type            = each.value.resource_record_type
  ttl             = 60
  zone_id         = aws_route53_zone.public.zone_id

  depends_on = [
    aws_acm_certificate.foo
  ]
}