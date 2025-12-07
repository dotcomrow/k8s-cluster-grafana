resource "grafana_folder" "proxmox" {
  title = "Proxmox"
}

output "Proxmox_folder_uid" {
  value = grafana_folder.proxmox.uid
}

resource "grafana_folder" "pfsense" {
  title = "PFSense"
}

output "PFSense_folder_uid" {
  value = grafana_folder.pfsense.uid
}

resource "grafana_folder" "cpu" {
  title = "CPU"
}

output "CPU_folder_uid" {
  value = grafana_folder.cpu.uid
}

resource "grafana_folder" "memory" {
  title = "Memory"
}

output "Memory_folder_uid" {
  value = grafana_folder.memory.uid
}

resource "grafana_folder" "disk" {
  title = "Disk"
}

output "Disk_folder_uid" {
  value = grafana_folder.disk.uid
}

resource "grafana_folder" "network" {
  title = "Network"
}

output "Network_folder_uid" {
  value = grafana_folder.network.uid
}
