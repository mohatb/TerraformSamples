provider "kubernetes" {
    host                   = azurerm_kubernetes_cluster.example.kube_config.0.host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
}

resource "kubernetes_service_account" "example" {
    automount_service_account_token = true
    metadata {
        name        = var.service_account_name
        namespace   = var.service_account_namespace
        annotations = {
            "azure.workload.identity/client-id" = azurerm_user_assigned_identity.example.client_id
        }
    }
}