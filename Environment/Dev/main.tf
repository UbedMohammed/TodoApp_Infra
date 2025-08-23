locals {
  tags = {
    environment = "dev-todoapp"
  }
}

module "rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "todoapp"
  rg_location = "central india"
  tags        = local.tags
}
module "acr" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_container_registery"
  acr_name   = "todoappacr"
  rg_name    = module.rg.rg_name
  location   = module.rg.rg_location
  tags       = local.tags
}
module "sa" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_storage_account"
  sa_name    = "todoappsa"
  rg_name    = module.rg.rg_name
  location   = module.rg.rg_location
  tags       = local.tags
}
module "sql_db" {
  depends_on        = [module.sql_server]
  source            = "../../modules/azurerm_sql_database"
  sql_database_name = "todoappdb"
  server_id         = module.sql_server.server_id
  tags              = local.tags
}
module "sql_server" {
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "todoappsqlserver"
  rg_name         = module.rg.rg_name
  location        = module.rg.rg_location
  admin_username  = "sqladminuser"
  admin_password  = "H@Sh1CoR3!"
  tags            = local.tags
}
module "managed_identity" {
  source                = "../../modules/azurerm_managed_identity"
  managed_identity_name = "todoappmi"
  rg_name               = module.rg.rg_name
  location              = module.rg.rg_location
  tags                  = local.tags
}
module "kubernetes_cluster" {
  depends_on = [module.acr, module.managed_identity, module.rg]
  source     = "../../modules/azurerm_kubernetes_cluster"
  aks_name   = "todoappaks"
  rg_name    = module.rg.rg_name
  location   = module.rg.rg_location
  dns_prefix = "todoappaks"
  node_count = 2
  tags       = local.tags
}
module "key_vault" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_key_vault"
  kv_name    = "todoappkv"
  rg_name    = module.rg.rg_name
  location   = module.rg.rg_location
  tags       = local.tags
}
