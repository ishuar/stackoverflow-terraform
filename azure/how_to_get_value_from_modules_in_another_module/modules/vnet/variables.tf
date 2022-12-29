variable "vnet_name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "location" {
  type        = string
  description = "(optional) describe your variable"
}
variable "resource_group_name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "address_space" {
  type        = list(string)
  description = "(optional) describe your variable"
}
variable "subnet_prefixes" {
  type        = list(string)
  description = "(optional) describe your variable"
}
