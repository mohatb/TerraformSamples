resource "azurerm_storage_account" "example" {
    name                     = "${random_string.name.result}sa"
    resource_group_name      = azurerm_resource_group.example.name
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
}

resource "azurerm_storage_container" "example" {
    name                  = "examplecontainer"
    storage_account_name  = azurerm_storage_account.example.name
    container_access_type = "private"
}