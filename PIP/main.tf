locals {
  tags = {
    environment     = "POC"
    "Resource Name" = "Public IP"
  }
}

resource "azurerm_public_ip" "pip-connect" {
  for_each            = var.pip
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg-connect.name
  location            = data.azurerm_resource_group.rg-connect.location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = local.tags
}