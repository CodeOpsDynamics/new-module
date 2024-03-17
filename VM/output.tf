output "vm-id" {
  value = [
    for vm in azurerm_linux_virtual_machine.vm-connect : vm.id
  ]
}