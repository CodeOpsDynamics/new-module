output "subnetid" {
  value = [
    for sb in azurerm_subnet.sb-connect : sb.id
  ]
}