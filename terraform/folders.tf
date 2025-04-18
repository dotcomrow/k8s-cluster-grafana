resource "grafana_folder" "Proxmox" {
  title    = "Proxmox"
}

output "Proxmox_folder_uid" {
  value = grafana_folder.Proxmox.uid
}

resource "grafana_folder" "PFSense" {
  title    = "PFSense"
}

output "PFSense_folder_uid" {
  value = grafana_folder.PFSense.uid
}

resource "grafana_folder" "Work-Node" {
  title    = "Work-Node"
}

output "Work_Node_folder_uid" {
  value = grafana_folder.Work-Node.uid
}

resource "grafana_folder" "Srvr-Node" {
  title    = "Srvr-Node"
}

output "Srvr_Node_folder_uid" {
  value = grafana_folder.Srvr-Node.uid
}

resource "grafana_folder" "Etcd-Node" {
  title    = "Etcd-Node"
}

output "Etcd_Node_folder_uid" {
  value = grafana_folder.Etcd-Node.uid
}

resource "grafana_folder" "Ctrl-Node" {
  title    = "Ctrl-Node"
}

output "Ctrl_Node_folder_uid" {
  value = grafana_folder.Ctrl-Node.uid
}

resource "grafana_folder" "GPU" {
  title    = "GPU"
}

output "GPU_folder_uid" {
  value = grafana_folder.GPU.uid
}

resource "grafana_folder" "CPU" {
  title    = "CPU"
}

output "CPU_folder_uid" {
  value = grafana_folder.CPU.uid
}

resource "grafana_folder" "Memory" {
  title    = "Memory"
}

output "Memory_folder_uid" {
  value = grafana_folder.Memory.uid
}

resource "grafana_folder" "Disk" {
  title    = "Disk"
}

output "Disk_folder_uid" {
  value = grafana_folder.Disk.uid
}

resource "grafana_folder" "Network" {
  title    = "Network"
}

output "Network_folder_uid" {
  value = grafana_folder.Network.uid
}
