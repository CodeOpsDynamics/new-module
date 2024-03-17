locals {
  tags = {
    environment  = "POC"
    ResourceName = "DB-Server`"
  }
}

resource "azurerm_mssql_server" "srv-connect" {
  name                         = "azureraidbserver1"
  resource_group_name          = data.azurerm_resource_group.rg-connect.name
  location                     = data.azurerm_resource_group.rg-connect.location
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIs11"

  tags = local.tags
}