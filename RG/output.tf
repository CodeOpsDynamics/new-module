output "id" {
  value = resource.azurerm_resource_group.rg-connect.id
  sensitive = true
}