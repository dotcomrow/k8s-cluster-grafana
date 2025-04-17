resource "grafana_dashboard" "CPU" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/cpu_metrics_dashboard.json")
  folder      = grafana_folder.CPU.id
}

resource "grafana_dashboard" "GPU" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/gpu_metrics_dashboard.json")
  folder      = grafana_folder.GPU.id
}

resource "grafana_dashboard" "Memory" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/memory_metrics_dashboard.json")
  folder      = grafana_folder.Memory.id
}

resource "grafana_dashboard" "Disk" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/disk_metrics_dashboard.json")
  folder      = grafana_folder.Disk.id
}

resource "grafana_dashboard" "Network" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/network_metrics_dashboard.json")
  folder      = grafana_folder.Network.id
}

resource "grafana_dashboard" "Proxmox" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/proxmox_metrics_dashboard.json")
  folder      = grafana_folder.Proxmox.id
}

resource "grafana_dashboard" "PFSense" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/pfsense_metrics_dashboard.json")
  folder      = grafana_folder.PFSense.id
}

resource "grafana_dashboard" "Srvr-Node" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/srvr_node_metrics_dashboard.json")
  folder      = grafana_folder.Srvr-Node.id
}

resource "grafana_dashboard" "Work-Node" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/work_node_metrics_dashboard.json")
  folder      = grafana_folder.Work-Node.id
}

resource "grafana_dashboard" "Ctrl-Node" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/ctrl_node_metrics_dashboard.json")
  folder      = grafana_folder.Ctrl-Node.id
}

resource "grafana_dashboard" "Etcd-Node" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/etcd_node_metrics_dashboard.json")
  folder      = grafana_folder.Etcd-Node.id
}

resource "grafana_dashboard" "GPU-Node" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/gpu_metrics_dashboard.json")
  folder      = grafana_folder.GPU.id
}

resource "grafana_dashboard" "IPMI_Metrics" {
  provider = grafana.cloud

  config_json = file("${path.module}/dashboards/ipmi_metrics_dashboard.json")
  folder      = grafana_folder.Proxmox.id
}