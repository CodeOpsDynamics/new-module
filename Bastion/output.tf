output "bs_id" {
  value = [
    for bs in azurerm_bastion_host.bs-connect : bs.id
  ]
}