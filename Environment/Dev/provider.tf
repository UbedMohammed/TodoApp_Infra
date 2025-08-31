terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "todoapp-tfstate-rg"
  #   storage_account_name = "ubedbackendstorage"
  #   container_name       = "devcontainer"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "3142e9bb-dc6c-403c-9fcf-cbf1d0163394"
}
