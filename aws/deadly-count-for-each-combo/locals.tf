locals {

  env = "dev"

  flatten_acm_object = flatten(
    [for first_step_value in aws_acm_certificate.foo :
      [for second_step_value in first_step_value.domain_validation_options : second_step_value]
  ])

}