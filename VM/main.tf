locals {
  tags = {
    Environment  = "POC"
    ResourceName = "VM"
  }
}

resource "azurerm_linux_virtual_machine" "vm-connect" {
  for_each                        = var.vm
  name                            = each.value.name
  resource_group_name             = data.azurerm_resource_group.rg-connect.name
  location                        = data.azurerm_resource_group.rg-connect.location
  size                            = "Standard_F2"
  admin_username                  = "merauser"
  admin_password                  = "merahai1@"
  disable_password_authentication = false
  network_interface_ids = [
    each.value.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  tags = local.tags
}
