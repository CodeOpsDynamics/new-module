output "nsg-id" {
    value = [
        for nsg in azurerm_network_security_group.nsg-connect : nsg.id
    ]
}