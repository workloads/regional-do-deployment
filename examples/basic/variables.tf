# # You can also set DIGITALOCEAN_TOKEN env variable
# # Set the variable value in *.tfvars file or use the -var="do_token=..." CLI option
variable "do_token" {
  description = "DO API token with read and write permissions."
  type        = string
  sensitive   = true
}

variable "tfe_organization" {
  type        = string
  description = "Name of Terraform Cloud Organization."
}

variable "tfe_workspace" {
  type        = string
  description = "Name of Terraform Cloud Workspace."
}

variable "project_identifier" {
  description = "Project Identifier."
  type        = string
}

variable "no_regions" {
  description = "List of regions not to deploy."
  type        = list(string)
  default     = [""]
}

# Compute Variables
variable "num_droplets" {
  description = "The number of droplets to be deployed."
  type        = number
  default     = 2
}

variable "droplet_size" {
  description = "The unique slug that identifies the type of Droplet."
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "droplet_backups" {
  description = "Boolean controlling if backups are made. Defaults to true."
  type        = bool
  default     = false
}

variable "enable_ssh" {
  description = "Boolean enabling connections to droplet via SSH by opening port 22 on the firewall."
  type        = bool
  default     = true
}

variable "ssh_pub_file" {
  description = "The path to the public key ssh file. Only one of var.ssh_pub_file or var.ssh_keys needs to be specified and should be used."
  type        = string
  default     = ""
}

variable "ssh_keys" {
  description = "A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. Only one of `var.ssh_keys` or `var.ssh_pub_file` needs to be specified and should be used."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A list of the tags to be added to the default (`[\"workloads\", \"digitalocean\", \"terraform\"]`) Droplet tags."
  type        = list(string)
  default     = []
}

variable "ssh_ip_range" {
  description = "An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for SSH. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}