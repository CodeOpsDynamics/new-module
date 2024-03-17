locals {
  tags = {
    environment = "POC"
    resource = "Storage Account"
  }
}

resource "azurerm_storage_account" "sa-connect" {
  for_each                 = var.sa
  name                     = each.value.name
  resource_group_name      = data.azurerm_resource_group.rg-connect.name
  location                 = data.azurerm_resource_group.rg-connect.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tags
}

resource "azurerm_storage_container" "ca-connect" {
  for_each              = var.sa
  name                  = each.value.caname
  storage_account_name  = azurerm_storage_account.sa-connect[each.key].name
  container_access_type = "private"
}