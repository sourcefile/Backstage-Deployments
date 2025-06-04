variable "subscriptionid" {
    type = string  
}
variable "rg_location" {
    type = string  
}
variable "rg_name" {
    type = string  
}
variable "vnetname" {
    type = string  
}


provider "azurerm" {
  subscription_id = var.subscriptionid
  features {}
}

resource "azurerm_resource_group" "resourcegroup" {
  name     = var.rg_name
  location = var.rg_location
  tags     = {
    Project = "Developer Platform"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetName
  location            = azurerm_resource_group.resourcegroup.rg_location
  resource_group_name = azurerm_resource_group.resourcegroup.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
  }

}