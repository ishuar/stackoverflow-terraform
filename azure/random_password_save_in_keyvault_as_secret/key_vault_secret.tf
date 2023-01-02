data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "stackoverflow" {

  name     = "rg-stackoverflow-test-001"
  location = "West Europe"
}
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault
resource "azurerm_key_vault" "stackoverflow" {

  name                        = "stackoverflowkv"
  location                    = azurerm_resource_group.stackoverflow.location
  resource_group_name         = azurerm_resource_group.stackoverflow.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy
resource "azurerm_key_vault_access_policy" "stackoverflow" {

  key_vault_id = azurerm_key_vault.stackoverflow.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get", "List"
  ]
  ## Set Permissions accordingly. 
  secret_permissions = [
    "Get",
    "List",
    "Set",
    "Delete",
    "Purge"
  ]
}
#ref: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret
resource "azurerm_key_vault_secret" "stackoverflow" {

  name            = "random-password-stackoverflow-tutorial"
  content_type    = "password"
  value           = random_password.stackoverflow.result
  key_vault_id    = azurerm_key_vault.stackoverflow.id
  expiration_date = "2023-01-03T10:13:26Z" # UTC datetime (Y-m-d'T'H:M:S'Z').

  depends_on = [
    azurerm_key_vault_access_policy.stackoverflow # explicit dependency to avoid access error messages.
  ]
}
