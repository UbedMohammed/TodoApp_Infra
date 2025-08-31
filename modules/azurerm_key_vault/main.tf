data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each = var.kv
  name                        = each.value.kv_name
  location                    = each.value.rg_name
  resource_group_name         = each.value.location
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  tags = each.value.tags

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "List", "Create", "Update", "Delete", "Recover", "Backup", "Restore", "Import"
    ]

    secret_permissions = [
      "Get", "List", "Create", "Update", "Delete", "Recover", "Backup", "Restore", "Import",
    ]

    storage_permissions = [
      "Get", "List", "Create", "Update", "Delete", "Recover", "Backup", "Restore", "Import"
    ]
  }
}