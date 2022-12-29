variable "name" {
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
variable "private_ip_address_allocation" {
  type        = string
  description = "(optional) describe your variable"
  default     = "Dynamic"
}
variable "subnet_id" {
  type        = string
  description = "(optional) describe your variable"
}
variable "ip_configuration" {
  type        = string
  description = "(optional) describe your variable"
}
