output "id" {
  value = [
    for sa in resource.azurerm_storage_account.sa-connect : sa.id
  ]
  sensitive = true
}