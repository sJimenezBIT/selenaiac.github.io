resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault.name
  location                    = var.resource_group.location
  resource_group_name         = var.resource_group.name
  enabled_for_disk_encryption = var.key_vault.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.key_vault.soft_delete_retention_days
  purge_protection_enabled    = var.key_vault.purge_protection_enabled

  enable_rbac_authorization       = var.key_vault.enable_rbac_authorization
  public_network_access_enabled   = var.key_vault.public_network_access_enabled

  sku_name = var.key_vault.sku_name

  access_policy {
    object_id               = data.azurerm_client_config.current.object_id
    tenant_id               = data.azurerm_client_config.current.tenant_id
    key_permissions         = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover"]
    certificate_permissions = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover"]
  }

  network_acls {
    default_action = "Deny"
    bypass         = "None"
  }

  tags = merge(var.tags, {
    service = "Key Vault"
  })
}

# Validar cuantos roles son necesarios ... 
resource "azurerm_role_assignment" "fun_cv" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.fun_cv_principal_id
}

resource "azurerm_role_assignment" "fun_doc" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.fun_doc_principal_id
}
