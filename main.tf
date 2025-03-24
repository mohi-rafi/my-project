variable "prefix" {
  default = "tg"
}
variable "postfix" {
  default = "dev"
}
variable "postfix1" {
  default = "prod"
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}pfm${var.postfix}"
  location = "north Europe"
}
resource "azurerm_resource_group" "example1" {
  name     = "${var.prefix}pfm1${var.postfix}"
  location = "west Europe"
}
resource "azurerm_storage_account" "example" {
  name                     = "${var.prefix}pfmstorageaccount${var.postfix}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "example1" {
  name                     = "${var.prefix}pfmstorageaccount1${var.postfix}"
  resource_group_name      = azurerm_resource_group.example1.name
  location                 = azurerm_resource_group.example1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}