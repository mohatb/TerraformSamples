resource "azurerm_kubernetes_cluster_node_pool" "Secondary" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.primary.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  os_type = "Linux"

  tags = {
    Environment = "UserPool"
  }
}