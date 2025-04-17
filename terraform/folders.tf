resource "grafana_folder" "Proxmox" {
  provider = grafana.cloud
  title    = "Proxmox"
}

output "Proxmox_folder_uid" {
  value = grafana_folder.Proxmox.uid
}

resource "grafana_folder" "PFSense" {
  provider = grafana.cloud
  title    = "PFSense"
}

output "PFSense_folder_uid" {
  value = grafana_folder.PFSense.uid
}

resource "grafana_folder" "Work-Node" {
  provider = grafana.cloud
  title    = "Work-Node"
}

output "Work_Node_folder_uid" {
  value = grafana_folder.Work-Node.uid
}

resource "grafana_folder" "Srvr-Node" {
  provider = grafana.cloud
  title    = "Srvr-Node"
}

output "Srvr_Node_folder_uid" {
  value = grafana_folder.Srvr-Node.uid
}

resource "grafana_folder" "Etcd-Node" {
  provider = grafana.cloud
  title    = "Etcd-Node"
}

output "Etcd_Node_folder_uid" {
  value = grafana_folder.Etcd-Node.uid
}

resource "grafana_folder" "Ctrl-Node" {
  provider = grafana.cloud
  title    = "Ctrl-Node"
}

output "Ctrl_Node_folder_uid" {
  value = grafana_folder.Ctrl-Node.uid
}

resource "grafana_folder" "GPU" {
  provider = grafana.cloud
  title    = "GPU"
}

output "GPU_folder_uid" {
  value = grafana_folder.GPU.uid
}

resource "grafana_folder" "CPU" {
  provider = grafana.cloud
  title    = "CPU"
}

output "CPU_folder_uid" {
  value = grafana_folder.CPU.uid
}

resource "grafana_folder" "Memory" {
  provider = grafana.cloud
  title    = "Memory"
}

output "Memory_folder_uid" {
  value = grafana_folder.Memory.uid
}

resource "grafana_folder" "Disk" {
  provider = grafana.cloud
  title    = "Disk"
}

output "Disk_folder_uid" {
  value = grafana_folder.Disk.uid
}

resource "grafana_folder" "Network" {
  provider = grafana.cloud
  title    = "Network"
}

output "Network_folder_uid" {
  value = grafana_folder.Network.uid
}
