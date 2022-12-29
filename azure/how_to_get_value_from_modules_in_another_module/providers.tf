terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.37.0"
    }
  }
  required_version = ">= 1.1.0"

/*
 !! Always Use remote backend for production code !!
 !   backend "azurerm" {
 !     resource_group_name  = ""
 !     storage_account_name = ""
 !     container_name       = ""
 !     key                  = ""
 !   }
*/
}

provider "azurerm" {
  features {}
}


