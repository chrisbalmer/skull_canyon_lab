resource "vsphere_host_port_group" "pg" {
  name                = "${var.pg_access_name}"
  host_system_id      = "${data.vsphere_host.host.id}"
  virtual_switch_name = "${var.switch_name}"
}