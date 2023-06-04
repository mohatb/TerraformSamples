resource "azurerm_resource_group" "primary" {
  name     = var.resource_group
  location = var.region
}