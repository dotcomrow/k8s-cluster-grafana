resource "grafana_folder" "Proxmox" {
  provider = grafana.cloud

  title = "Proxmox"
}

resource "grafana_folder" "Rancher" {
  provider = grafana.cloud

  title = "Rancher"
}

resource "grafana_folder" "PFSense" {
  provider = grafana.cloud

  title = "PFSense"
}

resource "grafana_folder" "Work-Node" {
  provider = grafana.cloud

  title = "Work-Node"
}

resource "grafana_folder" "Srvr-Node" {
  provider = grafana.cloud

  title = "Srvr-Node"
}

resource "grafana_folder" "Etcd-Node" {
  provider = grafana.cloud

  title = "Etcd-Node"
}

resource "grafana_folder" "Ctrl-Node" {
  provider = grafana.cloud

  title = "Ctrl-Node"
}

resource "grafana_folder" "GPU" {
  provider = grafana.cloud

  title = "GPU"
}

resource "grafana_folder" "CPU" {
  provider = grafana.cloud

  title = "CPU"
}

resource "grafana_folder" "Memory" {
  provider = grafana.cloud

  title = "Memory"
}

resource "grafana_folder" "Disk" {
  provider = grafana.cloud

  title = "Disk"
}

resource "grafana_folder" "Network" {
  provider = grafana.cloud

  title = "Network"
}

