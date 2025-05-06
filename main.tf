provider "azurerm" {
  features {}
  subscription_id = "54ebcd67-26a4-467b-bcb6-a1365feda8b5"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-secure-app"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-secure-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akssecure"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_A2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = {
    environment = "dev"
  }
}
