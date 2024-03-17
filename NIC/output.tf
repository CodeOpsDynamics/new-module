output "nicid" {
  value = [
    for nn in azurerm_network_interface.nic-connect : nn.id
  ]
}