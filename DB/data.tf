data "azurerm_mssql_server" "srv-connect" {
  name                = "azureraidbserver1"
  resource_group_name = "TerraRG1"
}