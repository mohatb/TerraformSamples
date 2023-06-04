provider "helm" {
  kubernetes {
    host     = azurerm_kubernetes_cluster.primary.kube_config.0.host

  client_certificate     = base64decode(azurerm_kubernetes_cluster.primary.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.primary.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.primary.kube_config.0.cluster_ca_certificate)

  }
}

resource "helm_release" "kube-prometheus" {
  name       = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = var.Monitoring_Namespace

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  depends_on = [
    azurerm_kubernetes_cluster.primary
  ]
}

