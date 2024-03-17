output "pip-id" {
  value = [
    for pip in azurerm_public_ip.pip-connect : pip.id
  ]
}