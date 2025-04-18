resource "null_resource" "upload_dashboard_cpu_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/cpu_metrics_dashboard.json ${grafana_folder.cpu.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_cpu_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [grafana_folder.cpu]
}

resource "null_resource" "upload_dashboard_gpu_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/gpu_metrics_dashboard.json ${grafana_folder.gpu.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_gpu_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_cpu_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_memory_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/memory_metrics_dashboard.json ${grafana_folder.memory.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_memory_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_gpu_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_disk_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/disk_metrics_dashboard.json ${grafana_folder.disk.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_disk_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_memory_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_network_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/network_metrics_dashboard.json ${grafana_folder.network.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_network_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_disk_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_proxmox_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/proxmox_metrics_dashboard.json ${grafana_folder.proxmox.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_proxmox_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_network_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_pfsense_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/pfsense_metrics_dashboard.json ${grafana_folder.pfsense.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_pfsense_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_proxmox_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_srvr_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/srvr_node_metrics_dashboard.json ${grafana_folder.srvr_node.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_srvr_node_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_pfsense_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_work_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/work_node_metrics_dashboard.json ${grafana_folder.work_node.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_work_node_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_srvr_node_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_ctrl_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/ctrl_node_metrics_dashboard.json ${grafana_folder.ctrl_node.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_ctrl_node_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_work_node_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_etcd_node_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/etcd_node_metrics_dashboard.json ${grafana_folder.etcd_node.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_etcd_node_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_ctrl_node_metrics_dashboard]
}

resource "null_resource" "upload_dashboard_ipmi_metrics_dashboard" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/upload_dashboard.sh ${path.module}/dashboards/ipmi_metrics_dashboard.json ${grafana_folder.proxmox.uid} ${var.grafana_instance_url} ${var.grafana_service_account_token}"
  }
  provisioner "local-exec" {
    command = "cat /tmp/grafana_upload_ipmi_metrics_dashboard.log || echo '⚠️ Log not found'"
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [null_resource.upload_dashboard_etcd_node_metrics_dashboard]
}
