data "azurerm_resource_group" "network" {
  count = local.azure ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  count               = local.azure ? 1 : 0
  name                = format("%s-%s", var.name, var.environment)
  resource_group_name = join("", data.azurerm_resource_group.network.*.name)
  location            = join("", data.azurerm_resource_group.network.*.location)
  address_space       = list(var.subnet_cidr)
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  count                = local.azure ? 1 : 0
  name                 = format("%s-%s", var.name, var.environment)
  resource_group_name  = join("", data.azurerm_resource_group.network.*.name)
  address_prefixes     = [var.subnet_cidr]
  virtual_network_name = join("", azurerm_virtual_network.vnet.*.name)
}
