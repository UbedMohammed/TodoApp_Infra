terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "todoapp-tfstate-rg"
  #   storage_account_name = "todoapptfstate"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "your_subscription_id"
}
