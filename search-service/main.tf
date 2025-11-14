resource "azurerm_search_service" "search" {
  name                = var.search_service.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  sku             = var.search_service.sku
  replica_count   = var.search_service.replica_count
  partition_count = var.search_service.partition_count

  semantic_search_sku = var.search_service.semantic_search_sku

  public_network_access_enabled = var.search_service.public_network_access_enabled

  tags = merge(var.tags, {
    service = "Search Service"
  })
}