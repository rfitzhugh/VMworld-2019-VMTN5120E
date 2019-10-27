## =============================================================================
#  Variables - Connect to vSphere                                              #
## =============================================================================
variable "vsphere_server" {
  type        = "string"
  description = "vCenter or ESXi host"
}

variable "vsphere_user" {
  type        = "string"
  description = "User with permissions to create VM"
}

variable "vsphere_password" {
  type        = "string"
  description = "Defined user password"
}

## =============================================================================
#  Variables - vSphere                                                         #
## =============================================================================
variable "vsphere_datacenter" {
  type        = "string"
  description = "vSphere datacenter"
}

variable "vsphere_cluster" {
    type      = "string"
    description = "vSphere cluster"
}

variable "vsphere_datastore" {
  type        = "string"
  description = "vSphere storage"
}

variable "vsphere_network" {
  type        = "string"
  description = "vSphere network"
}

## =============================================================================
#  Variables - Virtual Machine Name & Type                                     #
## =============================================================================
variable "vm_name" {
  type        = "string"
  description = "Name of the VM"
}

variable "template" {
  type        = "string"
  description = "vSphere VM template"
}

## =============================================================================
#  Variables - Virtual Machine Resources                                       #
## =============================================================================
variable "hosts" {
  type        = "list"
  description = "vSphere hosts to create vm(s) on"
  default     = []
}

variable "cpu" {
  type        = "string"
  description = "Number of CPUs to assign"
  default     = 2
}

variable "ram_mb" {
  type        = "string"
  description = "Amount of memory to assign (MB)"
  default     = "4096"
}

variable "disk_size" {
  type        = "string"
  description = "Amount of storage (GB)"
  default     = "40"
}

variable "ipv4_network" {
  type        = "string"
  description = "Primary ipv4 network"
  default     = "10.10.12.0/22"
}

variable "ipv4_address_start" {
  type        = "string"
  description = "Primary ipv4 address"
  default     = "10"
}

variable "ipv4_gateway" {
  type        = "string"
  description = "Primary ipv4 network gateway"
  default     = "10.10.12.1"
}

variable "dns_servers" {
  type        = "list"
  description = "DNS resolver(s)"
  default     = ["10.10.15.5"]
}

variable "dns_domain" {
  type        = "string"
  description = "Primary search-domain"
  default     = "rubrik.us"
}

variable "local_admin_password" {
  type        = "string"
  description = "Default Windows administrator password"
  default     = "Rubrik123!"
}

variable "join_domain" {
  type        = "string"
  description = "Join to domain"
  default     = true
}

variable "join_domain_name" {
  type        = "string"
  description = "Name of domain to join"
  default     = "rubrik.us"
}

variable "join_domain_user" {
  type        = "string"
  description = "Domain account for joining"
  default     = "rebecca@rubrik.us"
}

variable "join_domain_secret" {
  type        = "string"
  description = "Password for joining domain"
  default     = "Rubrik123!"
}

variable "windows_organization" {
  type        = "string"
  description = "Organization to join"
  default     = "Rubrik Inc."
}

variable "windows_workgroup" {
  type        = "string"
  description = "Workgroup to join"
  default     = "WORKGROUP"
}

variable "vsphere_boot_delay" {
  type = "string"
  description = "VM boot delay"
  default = 5000
}

variable "vsphere_folder" {
  type = "string"
  description = "vSphere folder to place VM"
  default = "TME_VMs"
}

variable "vsphere_info" {
  type = "string"
  description = "vSphere vm description"
  default = "Deployed with Terraform"
}

## =============================================================================
#  Variables - vCenter Attributes                                              #
## =============================================================================
variable "vsphere_custom_attributes" {
  type = "map"
  description = "vSphere vCenter only: custom attribute map"
  default = {}
}