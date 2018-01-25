data "vsphere_datacenter" "datacenter" {
}

data "vsphere_host" "host" {
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}