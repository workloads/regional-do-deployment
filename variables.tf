variable "do_api_endpoint" {
  type        = string
  description = "DigitalOcean API Endpoint."
  default     = "https://api.digitalocean.com"
}

variable "do_token" {
  description = "DO API token with read and write permissions."
  type        = string
  sensitive   = true
}

variable "tfe_organization" {
  description = "Name of Terraform Cloud Organization."
  type        = string
}

variable "tfe_workspace" {
  description = "Name of Terraform Cloud Workspace."
  type        = string
}

variable "project_identifier" {
  description = "Project Identifier."
  type        = string
}

variable "no_regions" {
  type        = list(string)
  description = "List of regions not to deploy."

  default = [
    ""
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
