locals {
  tags = {
    ResourceName = "MS-SQL-DB"
    environment  = "POC"
    foo          = "bar"
  }
}

resource "azurerm_mssql_database" "db-connect" {
  name           = "rai-db1"
  server_id      = data.azurerm_mssql_server.srv-connect.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  enclave_type   = "VBS"


  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}