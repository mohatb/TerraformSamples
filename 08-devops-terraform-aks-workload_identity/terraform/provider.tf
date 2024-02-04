# This file defines the providers used in the Terraform configuration.
# The "azurerm" provider is used to interact with Azure resources.
# The "random" provider is used to generate random values.

provider "azurerm" {
  features {}
}

provider "random" {}