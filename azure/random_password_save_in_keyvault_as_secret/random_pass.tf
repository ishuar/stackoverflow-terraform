resource "random_password" "stackoverflow" {
  length      = 16
  special     = true
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  min_lower   = 1
}
