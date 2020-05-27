provider "azurerm" {
  version = "2.2.0"
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  location = var.rg-location
}

resource "azurerm_virtual_network" "vn" {
  count               = length(var.vnet-prefix)
  name                = "${azurerm_resource_group.rg.name}-${var.vnet-prefix[count.index]}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.vnet-address[count.index]]
}



