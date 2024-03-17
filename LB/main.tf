resource "azurerm_lb" "lb-connect" {
  name                = "railb1"
  location            = data.azurerm_resource_group.rg-connect.location
  resource_group_name = data.azurerm_resource_group.rg-connect.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip-connect.id
  }
}

resource "azurerm_lb_backend_address_pool" "bp-connect" {
  loadbalancer_id = azurerm_lb.lb-connect.id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_backend_address_pool_address" "ba-connect" {
  for_each                = var.vm1
  name                    = each.value.name
  backend_address_pool_id = azurerm_lb_backend_address_pool.bp-connect.id
  virtual_network_id      = data.azurerm_virtual_network.vnet-connect.id
  ip_address              = data.azurerm_virtual_machine.vm-connect[each.key].private_ip_address
}

resource "azurerm_lb_probe" "pr-connect" {
  loadbalancer_id = azurerm_lb.lb-connect.id
  name            = "http-running-probe"
  port            = 8080
}

resource "azurerm_lb_rule" "rule-connect" {
  loadbalancer_id                = azurerm_lb.lb-connect.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bp-connect.id]
  probe_id                       = azurerm_lb_probe.pr-connect.id
}

