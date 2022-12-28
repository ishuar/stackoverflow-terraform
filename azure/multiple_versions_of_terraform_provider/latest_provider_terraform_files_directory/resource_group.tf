module "latest_provider_rg" {
  source = "../modules/resource_group"

  name     = "rg-3.37.0" ## name for demo purposes only
  location = "West Europe"
}
