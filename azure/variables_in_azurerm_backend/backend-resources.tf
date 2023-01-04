locals {
  backendstoragename = "stastackoverflow001"
}

# variable defintions
variable "tags" {
  type        = map(string)
  description = "(optional) Tags attached to resources"
  default = {
    used_case = "stastackoverflow"
  }
}
# Create an Azure resource group
resource "azurerm_resource_group" "stackoverflow" {
  name     = "RG-TERRAFORM-BACKEND-STACKOVERFLOW"
  location = "West Europe"
}

# Create an Azure storage account
resource "azurerm_storage_account" "stackoverflow" {
  name                     = local.backendstoragename ## or "${local.backendstoragename}" but better is local.backendstoragename
  location                 = azurerm_resource_group.stackoverflow.location
  resource_group_name      = azurerm_resource_group.stackoverflow.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags ## or "${var.tags}" but better is var.tags
}

# Create an Azure storage container
resource "azurerm_storage_container" "stackoverflow" {
  name                  = "stackoverflow"
  storage_account_name  = azurerm_storage_account.stackoverflow.name
  container_access_type = "private"
}
