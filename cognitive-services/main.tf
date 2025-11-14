module "cognitive_account" {
  source            = "./cognitive-account"
  for_each          = var.cognitive_services

  resource_group    = var.resource_group
  cognitive_account = each.value
  tags              = var.tags
  
}

module "cognitive_deployment" {
  source   = "./cognitive-deployment"
  for_each = var.cognitive_deployments
  
  cognitive_deployment = each.value
  cognitive_account_id = module.cognitive_account["open_ai"].id
  
}