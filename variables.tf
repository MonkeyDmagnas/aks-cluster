variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "braimy-resource-group"
}

variable "cluster_name" {
  default = "braimy-aks-cluster"
}

variable "node_count" {
  default = 1
}

variable "vm_size" {
  default = "Standard_D2_v2"
}
