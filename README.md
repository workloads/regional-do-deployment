# regional-do-deployment

Regional Deployment of DigitalOcean-specific Resources

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| do_token | DO API token with read and write permissions. | `string` | yes |
| project_identifier | Project Identifier. | `string` | yes |
| tfe_organization | Name of Terraform Cloud Organization. | `string` | yes |
| tfe_workspace | Name of Terraform Cloud Workspace. | `string` | yes |
| droplet_backups | Boolean controlling if backups are made. Defaults to true. | `bool` | no |
| droplet_size | The unique slug that identifies the type of Droplet. | `string` | no |
| enable_ssh | Boolean enabling connections to droplet via SSH by opening port 22 on the firewall. | `bool` | no |
| no_regions | List of regions not to deploy. | `list(string)` | no |
| num_droplets | The number of droplets to be deployed. | `number` | no |
| ssh_ip_range | An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for SSH. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset. | `list(string)` | no |
| ssh_keys | A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. Only one of `var.ssh_keys` or `var.ssh_pub_file` needs to be specified and should be used. | `list(string)` | no |
| ssh_pub_file | The path to the public key ssh file. Only one of var.ssh_pub_file or var.ssh_keys needs to be specified and should be used. | `string` | no |
| tags | A list of the tags to be added to the default (`["workloads", "digitalocean", "terraform"]`) Droplet tags. | `list(string)` | no |

### Outputs

| Name | Description |
|------|-------------|
| lb_ip | The Reserved IP assigned to the droplet. |
<!-- END_TF_DOCS -->