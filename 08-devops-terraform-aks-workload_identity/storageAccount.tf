# This resource block defines an Azure Storage Account.
# It creates a storage account with a randomly generated name, using the result of the "random_string" resource.
# The storage account is created in the same resource group and location as the "azurerm_resource_group" resource.
# The account tier is set to "Standard" and the replication type is set to "GRS".

resource "azurerm_storage_account" "example" {
    name                     = "${random_string.name.result}sa"
    resource_group_name      = azurerm_resource_group.example.name
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
}

# This resource block defines an Azure Storage Container.
# It creates a container named "examplecontainer" within the storage account created above.
# The container access type is set to "private".

resource "azurerm_storage_container" "example" {
    name                  = var.container_name
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = var.container_access_type
}