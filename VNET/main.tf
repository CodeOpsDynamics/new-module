locals {
  tags = {
    environment = "POC"
    resource = "Vnet"
  }
}

resource "azurerm_virtual_network" "vnet-connect" {
  for_each            = var.vn
  name                = each.value.name
  location            = data.azurerm_resource_group.rg-connect.location
  resource_group_name = data.azurerm_resource_group.rg-connect.name
  address_space       = each.value.address_space

  tags = local.tags
}