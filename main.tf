terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}

provider "kubectl" {
  config_path = "C:\Users\omsa3\.kube\config"
}


resource "kubectl_manifest" "app" {
  yaml_body = file("${path.module}/K8s")
}

