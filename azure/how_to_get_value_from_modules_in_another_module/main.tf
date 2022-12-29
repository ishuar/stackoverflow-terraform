resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "ib151w-vnet" {
  source = "./modules/vnet"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "ib151w-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
}
module "ib151w-nic" {
  source = "./modules/nic"

  name                = "${module.ib151w-vnet.vnet_name}-nic-test-123"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.ib151w-vnet.subnet_id
  ip_configuration    = "stackoverflow"
}
