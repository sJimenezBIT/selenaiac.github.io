# resource "azurerm_network_watcher" "this" {
#   name                = var.watcher.name
#   resource_group_name = var.watcher.resource_group
#   location            = var.watcher.region

#   tags = merge(var.tags, {
#     cidr    = var.vnet.cidr
#     service = "Network Watcher"
#   })
# }

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  address_space       = [var.vnet.cidr]

  # depends_on = [
  #   azurerm_network_watcher.this,
  # ]


  tags = merge(var.tags, {
    cidr    = var.vnet.cidr
    service = "Virtual Network"
  })
}

