resource "azurerm_service_plan" "plan" {
  name                = var.service_plan.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  os_type             = var.service_plan.os_type
  sku_name            = var.service_plan.sku_name
}

resource "azurerm_logic_app_standard" "la" {
  name                       = var.logic_app.name
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  app_service_plan_id        = azurerm_service_plan.plan.id
  storage_account_name       = var.sa.name
  storage_account_access_key = var.sa.primary_access_key
  virtual_network_subnet_id  = var.subnet.id
  storage_account_share_name = var.file_share_name

  https_only                               = var.logic_app.https_only
  # ftp_publish_basic_authentication_enabled = var.logic_app.ftp_publish_basic_authentication_enabled
  # scm_publish_basic_authentication_enabled = var.logic_app.scm_publish_basic_authentication_enabled
  public_network_access                    = var.logic_app.public_network_access

  site_config {
    use_32_bit_worker_process = false
    always_on                 = true
    http2_enabled = true

    # MUY IMPORTANTE: niega todo lo que no coincida con reglas
    ip_restriction {
        name        = "PowerPlatformPlexEastUS"
        priority    = 100
        action      = "Allow"
        service_tag = "PowerPlatformPlex.EastUS"
      }

      ip_restriction {
        name        = "PowerPlatformInfraEastUS"
        priority    = 101
        action      = "Allow"
        service_tag = "PowerPlatformInfra.EastUS"
      }

      ip_restriction {
        name        = "PowerPlatformInfraEastUS2"
        priority    = 102
        action      = "Allow"
        service_tag = "PowerPlatformInfra.EastUS2"
      }

      ip_restriction {
        name        = "PowerPlatformInfraWestUS2"
        priority    = 103
        action      = "Allow"
        service_tag = "PowerPlatformInfra.WestUS2"
      }

      ip_restriction {
        name        = "PowerPlatformPlexWestUS"
        priority    = 200
        action      = "Allow"
        service_tag = "PowerPlatformPlex.WestUS"
      }

      ip_restriction {
        name        = "AzureConnectorWestUS2"
        priority    = 201
        action      = "Allow"
        service_tag = "AzureConnectors.WestUS2"
      }

      ip_restriction {
        name        = "AzureConnectorEastUS"
        priority    = 202
        action      = "Allow"
        service_tag = "AzureConnectors.EastUS"
      }

      ip_restriction {
        name        = "AzureConnectorEastUS2"
        priority    = 203
        action      = "Allow"
        service_tag = "AzureConnectors.EastUS2"
      }

      ip_restriction {
        name        = "AzureConnectorWestUS"
        priority    = 204
        action      = "Allow"
        service_tag = "AzureConnectors.WestUS"
      }

      ip_restriction {
        name        = "PowerPlatformInfraWestUS"
        priority    = 205
        action      = "Allow"
        service_tag = "PowerPlatformInfra.WestUS"
      }

      ip_restriction {
        name        = "PowerPlatformPlex"
        priority    = 300
        action      = "Allow"
        service_tag = "PowerPlatformPlex"
      }

      ip_restriction {
        name        = "PowerPlatformEastUS2"
        priority    = 400
        action      = "Allow"
        service_tag = "PowerPlatformPlex.EastUS2"
      }

  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"      = "dotnet"
    "WEBSITE_NODE_DEFAULT_VERSION"  = "~20"
    "FUNCTIONS_INPROC_NET8_ENABLED" = "1"
    "WEBSITE_VNET_ROUTE_ALL"        = 1
    "WEBSITE_CONTENTOVERVNET"       = 1
  }

  identity { 
    type = "SystemAssigned" 
  }

  tags = merge(var.tags, {
    service = "Logic App Standard"
  })
}

# resource "azurerm_private_dns_zone" "azurewebsites" {
#   name                = "privatelink.azurewebsites.net"
#   resource_group_name = var.resource_group.name

# }

# resource "azurerm_private_dns_zone_virtual_network_link" "virtual_network_link_azurewebsites" {
#   name                  = "lapp-azurewebsites-link"
#   private_dns_zone_name = azurerm_private_dns_zone.azurewebsites.name
#   resource_group_name   = var.resource_group.name
#   virtual_network_id    = var.vnet_id
#   depends_on = [
#     azurerm_private_dns_zone.azurewebsites
#   ]
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