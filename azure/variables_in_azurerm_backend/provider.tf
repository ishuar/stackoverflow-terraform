terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.37.0"
    }
  }
  required_version = ">= 1.1.0"

  /*
!! IMPORTANT !! 

Below backend config has to be commented when using local backend.
*/

  backend "azurerm" {
    resource_group_name  = "RG-TERRAFORM-BACKEND-STACKOVERFLOW"
    storage_account_name = "stastackoverflow001"
    container_name       = "stackoverflow"
    key                  = "terraformstate"
  }
}

provider "azurerm" {
  features {}
}
