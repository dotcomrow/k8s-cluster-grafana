
locals {
  dashboards = {
    CPU          = "cpu_metrics_dashboard.json"
    GPU          = "gpu_metrics_dashboard.json"
    Memory       = "memory_metrics_dashboard.json"
    Disk         = "disk_metrics_dashboard.json"
    Network      = "network_metrics_dashboard.json"
    Proxmox      = "proxmox_metrics_dashboard.json"
    PFSense      = "pfsense_metrics_dashboard.json"
    Srvr_Node    = "srvr_node_metrics_dashboard.json"
    Work_Node    = "work_node_metrics_dashboard.json"
    Ctrl_Node    = "ctrl_node_metrics_dashboard.json"
    Etcd_Node    = "etcd_node_metrics_dashboard.json"
    IPMI_Metrics = "ipmi_metrics_dashboard.json"
  }

  folder_uids = {
    CPU          = grafana_folder.CPU.uid
    GPU          = grafana_folder.GPU.uid
    Memory       = grafana_folder.Memory.uid
    Disk         = grafana_folder.Disk.uid
    Network      = grafana_folder.Network.uid
    Proxmox      = grafana_folder.Proxmox.uid
    PFSense      = grafana_folder.PFSense.uid
    Srvr_Node    = grafana_folder.Srvr-Node.uid
    Work_Node    = grafana_folder.Work-Node.uid
    Ctrl_Node    = grafana_folder.Ctrl-Node.uid
    Etcd_Node    = grafana_folder.Etcd-Node.uid
    IPMI_Metrics = grafana_folder.Proxmox.uid
  }
}

resource "null_resource" "upload_dashboards" {
  for_each = local.dashboards

  provisioner "local-exec" {
    command = <<EOT
      echo "📤 Uploading ${each.key}..."
      jq --arg folderUid "${local.folder_uids[each.key]}" '.folderUid = $folderUid' "${path.module}/dashboards/${each.value}" \
        | curl -s -X POST \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer ${var.grafana_service_account_token}" \
            --data-binary @- \
            ${var.grafana_instance_url}/api/dashboards/db
    EOT
    interpreter = ["bash", "-c"]
  }

  triggers = {
    always_run = timestamp()
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
