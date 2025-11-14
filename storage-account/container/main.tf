resource "azurerm_storage_container" "container" {
  name                  = var.container.name
  storage_account_id    = var.sa_id
  container_access_type = var.container.container_access_type
}
