variable "region" {
  type    = string
  default = "westeurope"
}

variable "resource_group" {
  type    = string
  default = "gitops"
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
  default = "1.24.3"
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