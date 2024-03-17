resource "azurerm_subnet" "sb-connect" {
  for_each             = var.sb
  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.rg-connect.name
  virtual_network_name = each.value.vname
  address_prefixes     = each.value.address_prefixes

}