# This file contains the output variables for the Terraform module that deploys an AKS cluster with workload identity.

# The name of the AKS cluster.
output "cluster_name" {
  value = var.cluster_name
}

# The region where the AKS cluster is deployed.
output "region" {
  value = var.region
}

# The resource group where the AKS cluster is deployed.
output "resource_group" {
  value = var.resource_group
}

# The client certificate for accessing the AKS cluster.
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

# The raw kubeconfig for accessing the AKS cluster.
output "kube_config" {
  value     = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive = true
}

# The fully qualified domain name (FQDN) of the AKS cluster portal.
output "portal_fqdn" {
  value = azurerm_kubernetes_cluster.example.portal_fqdn
}

# The Client ID of the User Assigned Identity used by the AKS cluster.
output "Managed_Identity_client_id" {
  description = "The Client ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.example.client_id
}

# The name of the User Assigned Identity used by the AKS cluster.
output "Managed_Identity_client_Name" {
  description = "The Client ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.example.name
}

# The name of the storage account used by the AKS cluster.
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

# The name of the storage container used by the AKS cluster.
output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.example.name
}