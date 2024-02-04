# This resource block creates an Azure resource group.
resource "azurerm_resource_group" "example" {
  name     = var.resource_group
  location = var.region
}