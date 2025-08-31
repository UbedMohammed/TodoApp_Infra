module "rg" {
  source = "../../modules/azurerm_resource_group"
  rg     = var.rg
}

module "stg" {
  source = "../../modules/azurerm_storage_account"
  stg    = var.stg
}

# module "acr" {
#   source = "../../modules/azurerm_container_registry"
#   acr = var.acr
# }

# module "kv" {
#   source = "../../modules/azurerm_key_vault"
#   kv = var.kv   

# }

# module "sql_server" {
#   source = "../../modules/azurerm_sql_server"
#   sql_server = var.sql_server   
# }

# module "sql_db" {
#   depends_on = [ module.sql_server ]
#   source = "../../modules/azurerm_sql_database"
#   sql_database = var.sql_database
# }

# module "mid" {
#   source = "../../modules/azurerm_managed_identity"
#   mid = var.mid   

# }

# module "aks" {
#   depends_on = [ module.rg ]
#   source = "../../modules/azurerm_kubernetes_cluster"
#   aks = var.aks   

# }

