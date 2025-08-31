resource "azurerm_container_registry" "acr" {
  for_each = var.container_registry
  name                = each.value.acr_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = "Premium"
  admin_enabled       = false
  }

