data "azurerm_subnet" "sb-connect" {
  for_each             = var.sb1
  name                 = each.value.name
  virtual_network_name = each.value.vname
  resource_group_name  = "TerraRG1"
}

data "azurerm_resource_group" "rg-connect" {
  name = "TerraRG1"
}