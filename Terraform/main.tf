resource "azurerm_resource_group" "python-app-grp" {
    name = "python-app-group"
    location = "Central India"
}

resource "azurerm_kubernetes_cluster" "python-app" {
  name                = "python-app"
  location            = azurerm_resource_group.python-app-grp.location
  resource_group_name = azurerm_resource_group.python-app-grp.name
  dns_prefix = "pythonapp"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.python-app.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.python-app.kube_config_raw

  sensitive = true
}