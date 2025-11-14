resource "azurerm_storage_share" "file_share" {
  name                  = var.file_share.name
  storage_account_id    = var.sa_id
  quota                 = var.file_share.quota
}
