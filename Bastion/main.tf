resource "azurerm_bastion_host" "bs-connect" {
  for_each            = var.bs
  name                = each.value.name
  location            = data.azurerm_resource_group.rg-connect.location
  resource_group_name = data.azurerm_resource_group.rg-connect.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = each.value.sbid
    public_ip_address_id = each.value.pipid
  }
}