resource "azurerm_mssql_database" "sql_database" {
  name         = var.sql_database_name
  server_id    = var.server_id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = var.tags

  # # prevent the possibility of accidental data loss
  # lifecycle {
  #   prevent_destroy = true
  # }
}

variable "server_id" {}



