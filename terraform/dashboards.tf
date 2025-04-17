# Dashboard JSON filenames per folder
locals {
  dashboards = {
    CPU          = "cpu_metrics_dashboard.json"
    GPU          = "gpu_metrics_dashboard.json"
    Memory       = "memory_metrics_dashboard.json"
    Disk         = "disk_metrics_dashboard.json"
    Network      = "network_metrics_dashboard.json"
    Proxmox      = "proxmox_metrics_dashboard.json"
    PFSense      = "pfsense_metrics_dashboard.json"
    Srvr-Node    = "srvr_node_metrics_dashboard.json"
    Work-Node    = "work_node_metrics_dashboard.json"
    Ctrl-Node    = "ctrl_node_metrics_dashboard.json"
    Etcd-Node    = "etcd_node_metrics_dashboard.json"
    GPU-Node     = "gpu_metrics_dashboard.json"
    Proxmox = "ipmi_metrics_dashboard.json"
  }
}

# One null_resource per dashboard, inject folder UID dynamically
resource "null_resource" "upload_dashboards" {
  for_each = local.dashboards

  provisioner "local-exec" {
    command = <<EOT
      echo "📤 Uploading ${each.key} dashboard to its folder..."
      FOLDER_UID=$(
        terraform output -raw ${replace(each.key, "-", "_")}_folder_uid
      )
      jq --arg folderUid "$FOLDER_UID" '.folderUid = $folderUid' "${path.module}/dashboards/${each.value}" \
        | curl -s -X POST \
          -H "Content-Type: application/json" \
          -H "Authorization: Bearer ${var.grafana_service_account_token}" \
          --data-binary @- \
          https://${var.grafana_instance_url}/api/dashboards/db
    EOT
    interpreter = ["bash", "-c"]
  }

  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [
    grafana_folder.CPU,
    grafana_folder.GPU,
    grafana_folder.Memory,
    grafana_folder.Disk,
    grafana_folder.Network,
    grafana_folder.Proxmox,
    grafana_folder.PFSense,
    grafana_folder.Srvr-Node,
    grafana_folder.Work-Node,
    grafana_folder.Ctrl-Node,
    grafana_folder.Etcd-Node
  ]
}
