/*
  This Terraform code defines an Azure Kubernetes Service (AKS) cluster resource.
  It creates an AKS cluster with the specified name, location, resource group, DNS prefix, and Kubernetes version.
  The cluster is configured with the Azure network plugin and network policy.
  It also enables workload identity and OIDC issuer authentication.
  The default node pool is created with the specified name, node count, and VM size.
  The cluster identity is set to "SystemAssigned".
  Tags are added to the resource for better organization and management.
*/

resource "azurerm_kubernetes_cluster" "example" {
  name                = var.cluster_name
  location            = var.region
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.k8s_version
  local_account_disabled = false
  workload_identity_enabled = true
  oidc_issuer_enabled = true

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
  
  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.static-nodeCount
    vm_size    = var.machine_type
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    user = "abutaleb"
  }
}
