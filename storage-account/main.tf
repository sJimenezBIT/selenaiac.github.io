module "storage_account" {
  source              = "./storage-account"
  resource_group      = var.resource_group
  sa                  = var.sa
  tags                = var.tags
  vnet_id             = var.vnet_id
  subnet_id           = var.subnet_id
  outbound_subnets_id = var.outbound_subnets_id
}

module "container" {
  source    = "./container"
  for_each  = var.sa.containers
  container = each.value
  sa_id     = module.storage_account.id

}

module "file_share" {
  source     = "./file_share"
  for_each   = var.sa.file_shares
  file_share = each.value
  sa_id      = module.storage_account.id

}