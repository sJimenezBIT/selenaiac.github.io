
resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.endpoint.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  subnet_id           = var.endpoint.subnet_id
  tags = merge(var.tags, {
    service = "Private Endpoint"
  })

  private_service_connection {
    name                           = "${var.endpoint.name}-psc"
    private_connection_resource_id = var.endpoint.target_id
    is_manual_connection           = var.endpoint.is_manual_connection
    subresource_names              = [var.endpoint.subresource]
  }

  # Registra el A-record automáticamente en la Private DNS Zone adecuada
  private_dns_zone_group {
    name                 = "${var.endpoint.name}-dns"
    private_dns_zone_ids = [var.endpoint.dns_zone_id]
  }

}

# locals {
#   storage_subresources = ["blob", "file"]
# }

# resource "azurerm_private_endpoint" "private_endpoint_storage" {
#   for_each            = toset(local.storage_subresources)
#   location            = var.resource_group.location
#   name                = "pe-${azurerm_storage_account.sa.name}-${each.key}"
#   resource_group_name = var.resource_group.name
#   subnet_id           = var.subnet_id
#   private_service_connection {
#     is_manual_connection           = false
#     name                           = "pe-con-${azurerm_storage_account.sa.name}-${each.key}"
#     private_connection_resource_id = azurerm_storage_account.sa.id
#     subresource_names              = [each.key]
#   }
 
#   private_dns_zone_group {
#     name                 = "dns-${each.key}"
#     private_dns_zone_ids = [azurerm_private_dns_zone.web_core_windows.id]
#   }
  
# }

# resource "azurerm_private_endpoint" "private_endpoint" {
#   location            = var.resource_group.location
#   name                = "pe-${var.logic_app_name}"
#   resource_group_name = var.resource_group.name
#   subnet_id           = var.subnet_pe
#   private_service_connection {
#     is_manual_connection           = false
#     name                           = "pe-con-${var.logic_app_name}"
#     private_connection_resource_id = azurerm_logic_app_standard.la.id
#     subresource_names              = ["sites"]
#   }
 
#   private_dns_zone_group {
#     name                 = "default"
#     private_dns_zone_ids = [azurerm_private_dns_zone.azurewebsites.id]
#   }
#   depends_on = [azurerm_private_dns_zone.azurewebsites, azurerm_logic_app_standard.la, azurerm_private_dns_zone_virtual_network_link.virtual_network_link_azurewebsites]
# }