## Defaults ##
variable "resource_group_name" {
  type        = string
  description = "(optional) resource group name in which resources will created"
  default     = "stack-over-flow-query"
}
variable "location" {
  type        = string
  description = "(optional) location where resources would be created."
  default     = "east us 2"
}
