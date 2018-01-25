resource "vsphere_license" "licenseKey" {
  license_key = "${var.license}"
}