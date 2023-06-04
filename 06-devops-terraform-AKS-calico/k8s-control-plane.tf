resource "azurerm_kubernetes_cluster" "primary" {
  name                = var.cluster_name
  location            = var.region
  resource_group_name = var.resource_group
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.k8s_version

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
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

  depends_on = [
    azurerm_resource_group.primary
  ]

}
