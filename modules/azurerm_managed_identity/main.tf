resource "azurerm_user_assigned_identity" "managed_identity" {
  location            = var.location
  name                = var.managed_identity_name
  resource_group_name = var.rg_name
  tags = var.tags
}
