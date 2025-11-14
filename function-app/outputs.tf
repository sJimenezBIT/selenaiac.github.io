output "id" {
  value = azurerm_function_app_flex_consumption.func.id
}

output "name" {
  value = azurerm_function_app_flex_consumption.func.name
}

output "principal_id" {
  value = azurerm_function_app_flex_consumption.func.identity[0].principal_id
}