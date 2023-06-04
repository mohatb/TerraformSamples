resource "azurerm_kubernetes_cluster" "primary" {
  name                = var.cluster_name
  location            = var.region
  resource_group_name = azurerm_resource_group.primary.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.k8s_version
  local_account_disabled = true
  workload_identity_enabled = true
  oidc_issuer_enabled = true
  
  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = [azuread_group.primary.id]
    azure_rbac_enabled = true
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
  
  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.static-nodeCount
    vm_size    = var.machine_type
  }

  windows_profile {
    admin_username = "abutaleb"
    admin_password = "OietejsrIil7bNZKrnijZw=="
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
  user = "abutaleb"
  }

}
