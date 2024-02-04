# Provider configuration for Kubernetes
provider "kubernetes" {
    host                   = azurerm_kubernetes_cluster.example.kube_config.0.host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
}

# Resource definition for Kubernetes Service Account
resource "kubernetes_service_account" "example" {
    automount_service_account_token = true
    metadata {
        name        = var.service_account_name
        namespace   = var.service_account_namespace
        annotations = {
            "azure.workload.identity/client-id" = azurerm_user_assigned_identity.example.client_id
        }
    }
}

# Definition for a Kubernetes Pod
resource "kubernetes_pod" "access_azure_resources" {
  metadata {
    name = "access-azure-resources"
    labels = {
      "azure.workload.identity/use" = "true"
    }
  }

  spec {
    container {
      image = "mohatb/workloadidentitytest:latest"
      name  = "workloadidentity"

      env {
        name  = "AZURE_SUBSCRIPTION_ID"
        value = var.subscription_id_for_sample_pod
      }

      env {
        name  = "AZURE_RESOURCE_GROUP"
        value = var.resource_group_for_sample_pod
      }
    }

    service_account_name = "workload-identity-sa"

    volume {
      name = "test-token"

      projected {
        sources {
          service_account_token {
            path              = "test-token"
            expiration_seconds = 3600
            audience          = "test"
          }
        }
      }
    }
  }
}