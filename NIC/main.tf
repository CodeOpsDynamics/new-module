resource "azurerm_network_interface" "nic-connect" {
  for_each            = var.sb1
  name                = each.value.nn
  location            = data.azurerm_resource_group.rg-connect.location
  resource_group_name = data.azurerm_resource_group.rg-connect.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.sb-connect[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}