output "id" {
  value = azurerm_logic_app_standard.la.id
}

output "principal_id" {
  value = azurerm_logic_app_standard.la.identity[0].principal_id
}
