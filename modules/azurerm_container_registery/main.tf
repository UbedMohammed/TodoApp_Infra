resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = var.tags
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = var.tags
  }
}

