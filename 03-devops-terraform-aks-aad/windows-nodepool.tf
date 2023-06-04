resource "azurerm_kubernetes_cluster_node_pool" "secondary" {
  name                  = "win1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.primary.id
  vm_size               = var.machine_type
  enable_auto_scaling   = false
  os_type               = "Windows"
  node_count            = 1
}