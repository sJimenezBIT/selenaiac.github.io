resource "azurerm_subnet" "snet_compute_func" {
  name                 = var.subnet.snet_name_compute_func
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet.name
  address_prefixes     = [var.subnet.snet_cidr_compute_func]
  service_endpoints    = ["Microsoft.Storage.Global"]
  delegation {
    name = "${var.subnet.snet_name_compute_func}-delegation"

    service_delegation {
      name    = "Microsoft.App/environments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

}

resource "azurerm_subnet" "snet_compute_lapp" {
  name                 = var.subnet.snet_name_compute_lapp
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet.name
  address_prefixes     = [var.subnet.snet_cidr_compute_lapp]
  service_endpoints    = ["Microsoft.Storage.Global"]
  delegation {
    name = "${var.subnet.snet_name_compute_lapp}-delegation"
    service_delegation {
      name = "Microsoft.Web/serverFarms"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action"
      ]
    }
  }
}

resource "azurerm_subnet" "snet_apps_pe" {
  name                 = var.subnet.snet_name_compute_pe
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet.name
  address_prefixes     = [var.subnet.snet_cidr_compute_pe]

  delegation {
    name = "${var.subnet.snet_name_compute_func}-delegation"

    service_delegation {
      name    = "Microsoft.App/environments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

}

resource "azurerm_subnet" "snet_backend" {
  name                 = var.subnet.snet_name_backend
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.vnet.name
  address_prefixes     = [var.subnet.snet_cidr_backend]

  delegation {
    name = "${var.subnet.snet_name_compute_func}-delegation"

    service_delegation {
      name    = "Microsoft.App/environments"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }

}