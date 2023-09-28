# # # Set the variable value in *.tfvars file or use the -var="tf_token=..." CLI option
# variable "tf_token" {
#   description = "Terraform API token with read and write permissions."
#   type        = string
#   sensitive   = true
# }

# # You can also set DIGITALOCEAN_TOKEN env variable
# # Set the variable value in *.tfvars file or use the -var="do_token=..." CLI option
variable "do_token" {
  description = "DO API token with read and write permissions."
  type        = string
  sensitive   = true
}

# You can also set SPACES_ACCESS_KEY_ID env variable.
# Set the variable value in *.tfvars file or use the -var="spaces_access_key_id=..." CLI option
variable "spaces_access_key_id" {
  description = "Access key ID used for Spaces API operations."
  type        = string
  sensitive   = true
}

# You can also set SPACES_SECRET_ACCESS_KEY env variable
# Set the variable value in *.tfvars file or use the -var="spaces_secret_access_key=..." CLI option
variable "spaces_secret_access_key" {
  description = "Secret access key used for Spaces API operations."
  type        = string
  sensitive   = true
}

variable "no_regions" {
  description = "List of regions not to deploy."
  type        = list(string)
  default     = [""]
}

# Domain Variables
variable "domain" {
  description = "Domain name where the Workloads instances are accessible. The final domain will be of the format `region.workloads.example.com`"
  type        = string
}

# Storage Variables
variable "spaces_restrict_ip" {
  description = "Boolean signifying whether to restrict the spaces bucket to the droplet and reserved ips (as well as the ssh ips if set) or allow all ips. (N.B. If Enabled this will also disable Bucket access from DO's UI.)"
  type        = bool
  default     = false
}

# Database Variables
variable "db_size" {
  description = "The unique slug that identifies the type of Database."
  type        = string
  default     = "db-s-1vcpu-1gb"
}

variable "enable_db_con" {
  description = "Boolean enabling connections to database by opening port 5432 on the firewall."
  type        = bool
  default     = false
}

variable "db_ip_range" {
  description = "An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for the Database. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset."
  type        = list(string)
  default     = ["0.0.0.0/0"]
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
  description = "A list of the tags to be added to the default (`[\"supabase\", \"digitalocean\", \"terraform\"]`) Droplet tags."
  type        = list(string)
  default     = []
}

variable "ssh_ip_range" {
  description = "An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for SSH. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}