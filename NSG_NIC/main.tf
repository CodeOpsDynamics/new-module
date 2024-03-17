resource "azurerm_network_interface_security_group_association" "nsg-nic" {
  for_each                  = var.nn
  network_interface_id      = each.value.nic
  network_security_group_id = each.value.nsg
}