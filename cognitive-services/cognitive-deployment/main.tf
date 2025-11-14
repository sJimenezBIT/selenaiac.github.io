resource "azurerm_cognitive_deployment" "model" {
  name                 = var.cognitive_deployment.name
  cognitive_account_id = var.cognitive_account_id

  model {
    format  = var.cognitive_deployment.model_format
    name    = var.cognitive_deployment.model_name
    version = var.cognitive_deployment.model_version
  }

  sku {
    name     = var.cognitive_deployment.sku
    capacity = var.cognitive_deployment.sku_capacity
  }
}