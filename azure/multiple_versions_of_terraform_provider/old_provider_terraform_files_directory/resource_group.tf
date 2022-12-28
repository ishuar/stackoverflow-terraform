module "old_provider_rg" {
  source = "../modules/resource_group"

  name     = "rg-3.0.2" ## name for demo purposes only
  location = "West Europe"
}
