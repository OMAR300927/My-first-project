terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}

provider "kubectl" {
  config_path = "C:/Users/omsa3/.kube/config"
}


resource "kubectl_manifest" "app" {
  for_each  = fileset("${path.module}/k8s", "*.yaml")
  yaml_body = file("${path.module}/k8s/${each.value}")
}

