# locals {
#   # Asegurarnos de que el usuario actual siempre tenga acceso
#   default_access_policy = {
#     object_id               = data.azurerm_client_config.current.object_id
#     tenant_id               = data.azurerm_client_config.current.tenant_id
#     description             = "Usuario actual - Acceso automático"
#     key_permissions         = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover"]
#     secret_permissions      = ["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover"]
#     certificate_permissions = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Recover"]
#   }

#   # Combinar las políticas definidas con la política por defecto
# #   all_access_policies = concat([local.default_access_policy], var.access_policies)

# }