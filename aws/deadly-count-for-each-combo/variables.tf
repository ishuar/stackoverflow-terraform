variable "sub_domains" {
  type        = list(string)
  description = "(optional) Domains for which acm and route 53 services are required."
  default     = ["foo.com", "bar.com"]
}