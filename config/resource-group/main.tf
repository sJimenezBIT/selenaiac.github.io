resource "azurerm_resource_group" "this" {
  name     = var.resource_group.name
  location = var.resource_group.location

  tags = merge(var.tags, {
    service = "Resource Group"
  })
}