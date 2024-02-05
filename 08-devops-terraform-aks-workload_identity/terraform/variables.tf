variable "region" {
  type    = string
  default = "westeurope"
}

variable "resource_group" {
  type    = string
  default = "gitops-rg"
}

variable "cluster_name" {
  type    = string
  default = "gitops"
}

variable "default_node_pool_name" {
  type    = string
  default = "default"
}

variable "dns_prefix" {
  type    = string
  default = "gitops"
}

variable "k8s_version" {
  type = string
  default = "1.27.7"
}

variable "static-nodeCount" {
  type = number
  default = 1 
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 3
}

variable "machine_type" {
  type    = string
  default = "Standard_B2s"
}

variable "TF_LOG" {
  type = string
  default = "TRACE"
}

variable "service_account_name" {
  type    = string
  default = "workload-identity-sa"
}

variable "service_account_namespace" {
  type    = string
  default = "default"
}

variable "user_assigned_identity_name" {
  type    = string
  default = "user-assigned-workload-identity"
}

variable "container_name" {
  type    = string
  default = "datacontainer"
}

variable "container_access_type" {
  type    = string
  default = "private"
}

variable "subscription_id_for_sample_pod" {
  type    = string
  default = "<subscription_id>"
}

variable "resource_group_for_sample_pod" {
  type    = string
  default = "<resource_group>"
  
}