resource "azurerm_virtual_network_peering" "vnet-Peering" {
  for_each                  = var.vn2
  name                      = "peer-${each.key}"
  resource_group_name       = data.azurerm_resource_group.rg-connect.name
  virtual_network_name      = data.azurerm_virtual_network.vnet-connect[each.key].name
  remote_virtual_network_id = var.remote_virtual_network_ids[each.key].id

}