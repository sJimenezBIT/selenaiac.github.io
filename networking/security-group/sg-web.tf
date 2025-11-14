resource "azurerm_network_security_group" "sg_web" {
  name                = var.sec_group.sg_web_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
}

resource "azurerm_subnet_network_security_group_association" "sg_snet" {
  subnet_id                 = var.subnets.id
  network_security_group_id = azurerm_network_security_group.sg_web.id
}
