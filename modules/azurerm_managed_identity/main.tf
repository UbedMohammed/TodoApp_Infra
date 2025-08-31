resource "azurerm_user_assigned_identity" "managed_identity" {
  for_each = var.mid
  location            = each.value.location
  name                = each.value.managed_identity_name
  resource_group_name = each.value.rg_name
  tags = each.value.tags
}
