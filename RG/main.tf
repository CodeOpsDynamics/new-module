locals {
  tags = {
    environment = "POC"
    resource = "Resource Group"
  }
}

resource "azurerm_resource_group" "rg-connect" {
  name     = "TerraRG2"
  location = "West Europe"

  tags = local.tags
}