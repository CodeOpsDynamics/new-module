data "azurerm_resource_group" "rg-connect" {
  name = "TerraRG1"
}

data "azurerm_virtual_network" "vnet-connect" {
  for_each            = var.vn2
  name                = each.value.name
  resource_group_name = "TerraRG1"
}