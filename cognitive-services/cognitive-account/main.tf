resource "azurerm_cognitive_account" "cognitive_account" {
    name                = var.cognitive_account.name
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    kind     = var.cognitive_account.kind
    sku_name = var.cognitive_account.sku_name

    identity { 
        type = "SystemAssigned" 
    }

    # Seguridad
    local_auth_enabled            = var.cognitive_account.local_auth_enabled 
    public_network_access_enabled = var.cognitive_account.public_network_access_enabled
    custom_subdomain_name         = var.cognitive_account.custom_subdomain_name
    # local_auth_enabled            = false
    # public_network_access_enabled = false
    # network_acls {
    #     default_action = "Deny"
    #     bypass         = "None"
    # }

    tags = merge(var.tags, {
        service = "Cognitive Account"
    })
}
