provider "azurerm" {
  version = "2.2.0"
  features {}
}
resource "azurerm_resource_group" "r" {
  name     = "${var.rg-location}-${var.rg-name}"
  location = var.rg-location
}

resource "azurerm_virtual_network" "vn" {
  count               = length(var.vnet-prefix)
  name                = "${azurerm_resource_group.r.name}-${var.vnet-prefix[count.index]}"
  resource_group_name = azurerm_resource_group.r.name
  location            = azurerm_resource_group.r.location
  address_space       = [var.vnet-address[count.index]]
}

resource "azurerm_virtual_network_peering" "vnp" {
  count                     = length(var.vnet-peer)
  name                      = var.vnet-peer[count.index]
  resource_group_name       = azurerm_resource_group.r.name
  virtual_network_name      = count.index == 0 ? azurerm_virtual_network.vn[0].name : azurerm_virtual_network.vn[1].name
  remote_virtual_network_id = count.index == 0 ? azurerm_virtual_network.vn[1].id : azurerm_virtual_network.vn[0].id

}




