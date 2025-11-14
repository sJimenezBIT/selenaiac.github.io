resource "azurerm_storage_account" "sa" {
  name                     = var.sa.name
  resource_group_name      = var.resource_group.name
  location                 = var.resource_group.location

  account_kind             = var.sa.account_kind
  account_tier             = var.sa.account_tier
  account_replication_type = var.sa.account_replication_type
  access_tier              = var.sa.access_tier

  is_hns_enabled           = var.sa.is_hns_enabled
  sftp_enabled             = var.sa.sftp_enabled

  https_traffic_only_enabled = var.sa.https_traffic_only_enabled
  min_tls_version            = var.sa.min_tls_version

  #NUEVO CONTENIDO
  allow_nested_items_to_be_public   = var.sa.allow_nested_items_to_be_public
  infrastructure_encryption_enabled = var.sa.infrastructure_encryption_enabled

  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"] # opcional
    virtual_network_subnet_ids = var.outbound_subnets_id
  }

  tags = merge(var.tags, {
    service = "Storage Account"
  })
}
