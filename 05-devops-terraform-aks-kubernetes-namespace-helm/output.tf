output "cluster_name" {
  value = var.cluster_name
}

output "region" {
  value = var.region
}

output "resource_group" {
  value = var.resource_group
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.primary.kube_config_raw
  sensitive = true
}

output "portal_fqdn" {
  value = azurerm_kubernetes_cluster.primary.portal_fqdn
}

output "client_certificate" {
  
  value = base64decode(azurerm_kubernetes_cluster.primary.kube_config.0.client_certificate)
  sensitive = true
  
}

output "client_key" {
  
  value = base64decode(azurerm_kubernetes_cluster.primary.kube_config.0.client_key)
  sensitive = true
  
}

output "cluster_ca_certificate" {
  
  value = base64decode(azurerm_kubernetes_cluster.primary.kube_config.0.cluster_ca_certificate)
  sensitive = true
  
}

output "cluster_server_address" {
  
  value = azurerm_kubernetes_cluster.primary.kube_config.0.host
  sensitive = true
  
}
