data "vsphere_vmfs_disks" "available" {
  host_system_id = "${data.vsphere_host.host.id}"
  rescan         = true
  filter         = "NVMe"
}

resource "vsphere_vmfs_datastore" "datastore" {
  name           = "${var.ds_name}"
  host_system_id = "${data.vsphere_host.host.id}"
  disks = ["${data.vsphere_vmfs_disks.available.disks}"]
}