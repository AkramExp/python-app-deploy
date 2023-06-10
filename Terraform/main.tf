variable "civo_token" {}

terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

provider "civo" {
  token = var.civo_token
  region = "LON1"
}

data "civo_size" "xsmall" {
    filter {
        key = "type"
        values = ["kubernetes"]
    }
    sort {
        key = "ram"
        direction = "asc"
    }
}

resource "civo_firewall" "k8s-firewall" {
    name = "k8s-firewall"
    create_default_rules = false
    ingress_rule {
      protocol = "tcp"
      port_range = "6443"
      cidr = ["0.0.0.0/0"]
      action = "allow" 
    }
}

resource "civo_kubernetes_cluster" "python-app" {
    name = "python-app"
    applications = ""
    firewall_id = civo_firewall.k8s-firewall.id
    pools {
        size = element(data.civo_size.xsmall.sizes, 0).name
        node_count = 1
    }
}

output "cluster_kubeconfig" {
  value = civo_kubernetes_cluster.python-app.kubeconfig
  sensitive = true
}