resource "azurerm_user_assigned_identity" "example" {
    name                = var.user_assigned_identity_name
    resource_group_name = azurerm_resource_group.example.name
    location            = var.region
}

resource "azurerm_role_assignment" "example" {
    scope                = azurerm_resource_group.example.id
    role_definition_name = "Contributor"
    principal_id         = azurerm_user_assigned_identity.example.principal_id
}

resource "azurerm_federated_identity_credential" "example" {
    name                = var.service_account_name
    resource_group_name = azurerm_resource_group.example.name
    audience            = ["api://AzureADTokenExchange"]
    issuer              = azurerm_kubernetes_cluster.example.oidc_issuer_url
    parent_id           = azurerm_user_assigned_identity.example.id # Updated parent_id
    subject             = "system:serviceaccount:${var.service_account_namespace}:${var.service_account_name}"
}