data "azurerm_resource_group" "rg-connect" {
  name = "TerraRG1"
}

data "azurerm_virtual_network" "vnet-connect" {
  name                = "terravnet2"
  resource_group_name = data.azurerm_resource_group.rg-connect.name
}

data "azurerm_virtual_machine" "vm-connect" {
  for_each            = var.vm1
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg-connect.name
}

data "azurerm_public_ip" "pip-connect" {
  name                = "terrapip2"
  resource_group_name = data.azurerm_resource_group.rg-connect.name
}