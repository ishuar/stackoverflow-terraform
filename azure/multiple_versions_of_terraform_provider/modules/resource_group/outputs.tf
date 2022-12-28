output "name" {
  value       = azurerm_resource_group.this.name
  description = " The Name of the Resource Group"
}
output "location" {
  description = " The Azure Region/location for the resource group"
  value       = azurerm_resource_group.this.location
}
