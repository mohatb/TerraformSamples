output "cluster_name" {
  value = var.cluster_name
}

output "region" {
  value = var.region
}

output "resource_group" {
  value = var.resource_group
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw
  sensitive = true
}

output "portal_fqdn" {
  value = azurerm_kubernetes_cluster.example.portal_fqdn
}

output "Managed_Identity_client_id" {
  description = "The Client ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.example.client_id
}

output "Managed_Identity_client_Name" {
  description = "The Client ID of the User Assigned Identity"
  value       = azurerm_user_assigned_identity.example.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

output "container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.example.name
}