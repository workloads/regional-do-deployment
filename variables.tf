# # You can also set DIGITALOCEAN_TOKEN env variable
# # Set the variable value in *.tfvars file or use the -var="do_token=..." CLI option
variable "do_token" {
  type        = string
  description = "DO API token with read and write permissions."
  sensitive   = true
}

variable "no_regions" {
  type        = list(string)
  description = "List of regions not to deploy."

  default = [
    ""
  ]
}

# Domain Variables
variable "domain" {
  type        = string
  description = "Domain name where the Workloads instances are accessible. The final domain will be of the format `region.workloads.example.com`"
}

# Storage Variables
variable "spaces_restrict_ip" {
  type        = bool
  description = "Boolean signifying whether to restrict the spaces bucket to the droplet and reserved ips (as well as the ssh ips if set) or allow all ips. (N.B. If Enabled this will also disable Bucket access from DO's UI.)"
  default     = false
}

# Database Variables
variable "db_size" {
  type        = string
  description = "The unique slug that identifies the type of Database."
  default     = "db-s-1vcpu-1gb"
}

variable "enable_db_con" {
  type        = bool
  description = "Boolean enabling connections to database by opening port 5432 on the firewall."
  default     = false
}

variable "db_ip_range" {
  type        = list(string)
  description = "An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for the Database. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset."

  default = [
    "0.0.0.0/0"
  ]
}

# Compute Variables
variable "num_droplets" {
  type        = number
  description = "The number of droplets to be deployed."
  default     = 2
}

variable "droplet_size" {
  type        = string
  description = "The unique slug that identifies the type of Droplet."
  default     = "s-1vcpu-2gb"
}

variable "droplet_backups" {
  type        = bool
  description = "Boolean controlling if backups are made. Defaults to true."
  default     = false
}

variable "enable_ssh" {
  type        = bool
  description = "Boolean enabling connections to droplet via SSH by opening port 22 on the firewall."
  default     = true
}

variable "ssh_pub_file" {
  type        = string
  description = "The path to the public key ssh file. Only one of var.ssh_pub_file or var.ssh_keys needs to be specified and should be used."
  default     = ""
}

variable "ssh_keys" {
  type        = list(string)
  description = "A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. Only one of `var.ssh_keys` or `var.ssh_pub_file` needs to be specified and should be used."

  default = []
}

variable "tags" {
  type        = list(string)
  description = "A list of the tags to be added to the default (`[\"workloads\", \"digitalocean\", \"terraform\"]`) Droplet tags."

  default = []
}

variable "ssh_ip_range" {
  type        = list(string)
  description = "An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for SSH. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset."

  default = [
    "0.0.0.0/0"
  ]
}
