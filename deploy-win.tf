## =============================================================================
#  Deploy Windows VM from vSphere Template                                     #
## =============================================================================
resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "2"
  memory   = "6144"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${var.disk_size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

# ------------------------------------------------------------------------------
  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
   
    customize {
      timeout      = -1
      ipv4_gateway = "${var.ipv4_gateway}"
      
      network_interface { }
      
      windows_options {
        computer_name         = "${var.vm_name}"
        admin_password        = "${var.local_admin_password}"
        organization_name     = "${var.windows_organization}"
        workgroup             = "${var.join_domain}" ? null : "${var.windows_workgroup}"
        join_domain           = "${var.join_domain}" ? "${var.join_domain_name}"   : null
        domain_admin_user     = "${var.join_domain}" ? "${var.join_domain_user}"   : null
        domain_admin_password = "${var.join_domain}" ? "${var.join_domain_secret}" : null
        auto_logon            = true
        auto_logon_count      = 1
      }
    }
  }
}