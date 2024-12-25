provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = module.aks.kube_config_host
  client_certificate     = base64decode(module.aks.kube_config_client_certificate)
  client_key             = base64decode(module.aks.kube_config_client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config_cluster_ca_certificate)
}

# Resource Group Module
module "resource_group" {
  source = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

# AKS Cluster Module
module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.resource_group.name
  cluster_name        = var.cluster_name
  location            = var.location
  node_count          = var.node_count
  vm_size             = var.vm_size
}
