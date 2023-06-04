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
  value     = azurerm_kubernetes_cluster.primary.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.primary.kube_config_raw
  sensitive = true
}

output "portal_fqdn" {
  value = azurerm_kubernetes_cluster.primary.portal_fqdn
}