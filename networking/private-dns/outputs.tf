output "dns_blob_id" {
  value = azurerm_private_dns_zone.dns_sa_blob.id
}

output "dns_file_id" {
  value = azurerm_private_dns_zone.dns_sa_file.id
}

# output "dns_cognitive_id" {
#   value = azurerm_private_dns_zone.dns_cognitive_services.id
# }

# output "dns_open_ai_id" {
#   value = azurerm_private_dns_zone.dns_open_ai.id
# }

output "dns_lapp_id" {
  value = azurerm_private_dns_zone.dns_logic_apps.id
}

# output "azure_websites_id" {
#   value = azurerm_private_dns_zone.private_dns_zone.id
# }