variable "grafana_instance_url" {}
variable "grafana_service_account_token" {}


resource "null_resource" "upload_dashboard_cpu_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/cpu_metrics_dashboard.json ${grafana_folder["CPU"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["CPU"]]
}


resource "null_resource" "upload_dashboard_gpu_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/gpu_metrics_dashboard.json ${grafana_folder["GPU"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["GPU"]]
}


resource "null_resource" "upload_dashboard_memory_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/memory_metrics_dashboard.json ${grafana_folder["Memory"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Memory"]]
}


resource "null_resource" "upload_dashboard_disk_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/disk_metrics_dashboard.json ${grafana_folder["Disk"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Disk"]]
}


resource "null_resource" "upload_dashboard_network_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/network_metrics_dashboard.json ${grafana_folder["Network"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Network"]]
}


resource "null_resource" "upload_dashboard_proxmox_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/proxmox_metrics_dashboard.json ${grafana_folder["Proxmox"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Proxmox"]]
}


resource "null_resource" "upload_dashboard_pfsense_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/pfsense_metrics_dashboard.json ${grafana_folder["PFSense"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["PFSense"]]
}


resource "null_resource" "upload_dashboard_srvr_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/srvr_node_metrics_dashboard.json ${grafana_folder["Srvr-Node"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Srvr-Node"]]
}


resource "null_resource" "upload_dashboard_work_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/work_node_metrics_dashboard.json ${grafana_folder["Work-Node"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Work-Node"]]
}


resource "null_resource" "upload_dashboard_ctrl_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/ctrl_node_metrics_dashboard.json ${grafana_folder["Ctrl-Node"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Ctrl-Node"]]
}


resource "null_resource" "upload_dashboard_etcd_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/etcd_node_metrics_dashboard.json ${grafana_folder["Etcd-Node"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Etcd-Node"]]
}


resource "null_resource" "upload_dashboard_ipmi_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/ipmi_metrics_dashboard.json ${grafana_folder["Proxmox"].uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }

  triggers = {
    always_run = timestamp()
  }

  depends_on = [grafana_folder["Proxmox"]]
}
