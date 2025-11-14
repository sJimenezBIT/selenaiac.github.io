resource "azurerm_service_plan" "fc" {
  name                = var.service_plan.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  os_type             = var.service_plan.os_type
  sku_name            = var.service_plan.sku_name
}

resource "azurerm_function_app_flex_consumption" "func" {
  name                      = var.function_app.name
  resource_group_name       = var.resource_group.name
  location                  = var.resource_group.location
  service_plan_id           = azurerm_service_plan.fc.id
  virtual_network_subnet_id = var.subnet.id

  storage_container_type      = var.function_app.storage_container_type
  storage_container_endpoint  = "${var.sa.primary_blob_endpoint}${var.container_name}"
  storage_authentication_type = var.function_app.storage_authentication_type
  storage_access_key          = var.sa.primary_access_key

  runtime_name    = var.function_app.runtime_name
  runtime_version = var.function_app.runtime_version

  instance_memory_in_mb  = var.function_app.instance_memory_in_mb

  https_only = false

  public_network_access_enabled = false

  site_config {}

  tags = merge(var.tags, {
    service = "Function App"
  })
}
