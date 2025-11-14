resource "azurerm_private_dns_zone" "dns_sa_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group.name
 
}

resource "azurerm_private_dns_zone_virtual_network_link" "link_sa_blob" {
  name                  = "blob_link"
  private_dns_zone_name = azurerm_private_dns_zone.dns_sa_blob.name
  resource_group_name   = var.resource_group.name
  virtual_network_id    = var.vnet_id
  
}

resource "azurerm_private_dns_zone" "dns_sa_file" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = var.resource_group.name
 
}

resource "azurerm_private_dns_zone_virtual_network_link" "link_sa_file" {
  name                  = "file_link"
  private_dns_zone_name = azurerm_private_dns_zone.dns_sa_file.name
  resource_group_name   = var.resource_group.name
  virtual_network_id    = var.vnet_id
  
}

# resource "azurerm_private_dns_zone" "dns_cognitive_services" {
#   name                = "privatelink.cognitiveservices.azure.com"
#   resource_group_name = var.resource_group.name

# }

# resource "azurerm_private_dns_zone_virtual_network_link" "link_cognitive_services" {
#   name                  = "cognitive_link"
#   private_dns_zone_name = azurerm_private_dns_zone.dns_cognitive_services.name
#   resource_group_name   = var.resource_group.name
#   virtual_network_id    = var.vnet_id

# }

# resource "azurerm_private_dns_zone" "dns_open_ai" {
#   name                = "privatelink.openai.azure.com"
#   resource_group_name = var.resource_group.name

# }

# resource "azurerm_private_dns_zone_virtual_network_link" "link_open_ai" {
#   name                  = "open_ai_link"
#   private_dns_zone_name = azurerm_private_dns_zone.dns_open_ai.name
#   resource_group_name   = var.resource_group.name
#   virtual_network_id    = var.vnet_id

# }

resource "azurerm_private_dns_zone" "dns_logic_apps" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.resource_group.name

}

resource "azurerm_private_dns_zone_virtual_network_link" "link_logic_apps" {
  name                  = "site_link"
  private_dns_zone_name = azurerm_private_dns_zone.dns_logic_apps.name
  resource_group_name   = var.resource_group.name
  virtual_network_id    = var.vnet_id

}






# resource "azurerm_private_dns_zone" "private_dns_zone" {
#   name                = var.private_dns_zone.name
#   resource_group_name = var.resource_group.name

# }

# resource "azurerm_private_dns_zone_virtual_network_link" "virtual_network_link" {
#   name                  = var.private_dns_zone.link_name
#   private_dns_zone_name = azurerm_private_dns_zone.private_dns_zone.name
#   resource_group_name   = var.resource_group.name
#   virtual_network_id    = var.vnet_id

# }

# resource "azurerm_private_dns_zone" "kv" {
#   name                = "privatelink.vaultcore.azure.net"
#   resource_group_name = var.resource_group.name
# }

# resource "azurerm_private_dns_zone_virtual_network_link" "kv" {
#   name                  = "vnetlink"
#   resource_group_name   = var.resource_group.name
#   private_dns_zone_name = azurerm_private_dns_zone.kv.name
#   virtual_network_id    = var.vnet_id
# }

