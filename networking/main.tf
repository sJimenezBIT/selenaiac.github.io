module "subnets" {
  source               = "./subnets"
  vnet            = module.vnet
  resource_group       = var.resource_group
  subnet               = var.subnet
}

module "private_dns" {
  source         = "./private-dns"
  vnet_id        = module.vnet.id
  resource_group = var.resource_group
}

module "vnet" {
  source         = "./vnet"
  resource_group = var.resource_group
  tags           = var.tags
  vnet           = var.vnet
}
# module "security_group" {
#   source         = "./security-group"
#   subnets        = module.subnets
#   resource_group = var.resource_group
#   tags           = var.tags
#   sec_group      = var.sec_group
# }

# module "peering" {
#   source         = "./peering"
#   vnet           = var.vnet
#   resource_group = var.resource_group
#   rg             = var.rg
# }

