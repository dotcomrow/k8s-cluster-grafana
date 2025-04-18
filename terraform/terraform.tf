terraform {
  required_providers {
      grafana = {
         source  = "grafana/grafana"
         version = ">= 2.9.0"
      }
  }
}

provider "grafana" {
   alias = "grafana-cloud"

   url   = var.grafana_instance_url
   auth  = var.grafana_service_account_token
}