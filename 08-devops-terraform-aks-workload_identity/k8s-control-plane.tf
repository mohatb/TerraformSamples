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
