data "azurerm_client_config" "this" {}

module "resource_group" {
  source              = "./resource-group"
  resource_group      = var.resource_group
  tags                = var.tags
}
