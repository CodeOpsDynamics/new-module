output "vn" {
    value = [
        for vn in azurerm_virtual_network.vnet-connect : vn.id
    ]
}