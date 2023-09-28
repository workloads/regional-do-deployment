# regional-do-deployment
Regional Deployment of DigitalOcean-specific Resources

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| do_token | DO API token with read and write permissions. | `string` | yes |
| domain | Domain name where the Workloads instances are accessible. The final domain will be of the format `region.workloads.example.com` | `string` | yes |
| spaces_access_key_id | Access key ID used for Spaces API operations. | `string` | yes |
| spaces_secret_access_key | Secret access key used for Spaces API operations. | `string` | yes |
| db_ip_range | An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for the Database. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset. | `list(string)` | no |
| db_size | The unique slug that identifies the type of Database. | `string` | no |
| droplet_backups | Boolean controlling if backups are made. Defaults to true. | `bool` | no |
| droplet_size | The unique slug that identifies the type of Droplet. | `string` | no |
| enable_db_con | Boolean enabling connections to database by opening port 5432 on the firewall. | `bool` | no |
| enable_ssh | Boolean enabling connections to droplet via SSH by opening port 22 on the firewall. | `bool` | no |
| no_regions | List of regions not to deploy. | `list(string)` | no |
| num_droplets | The number of droplets to be deployed. | `number` | no |
| spaces_restrict_ip | Boolean signifying whether to restrict the spaces bucket to the droplet and reserved ips (as well as the ssh ips if set) or allow all ips. (N.B. If Enabled this will also disable Bucket access from DO's UI.) | `bool` | no |
| ssh_ip_range | An array of strings containing the IPv4 addresses and/or IPv4 CIDRs from which the inbound traffic will be accepted for SSH. Defaults to ALL IPv4s but it is highly suggested to choose a smaller subset. | `list(string)` | no |
| ssh_keys | A list of SSH key IDs or fingerprints to enable in the format [12345, 123456]. Only one of `var.ssh_keys` or `var.ssh_pub_file` needs to be specified and should be used. | `list(string)` | no |
| ssh_pub_file | The path to the public key ssh file. Only one of var.ssh_pub_file or var.ssh_keys needs to be specified and should be used. | `string` | no |
| tags | A list of the tags to be added to the default (`["supabase", "digitalocean", "terraform"]`) Droplet tags. | `list(string)` | no |

### Outputs

| Name | Description |
|------|-------------|
| bucket_name | Name of the Spaces Bucket. |
| database | Name of the cluster's default database. |
| db_host | Database cluster's hostname. |
| db_password | Password for the cluster's default user. |
| db_port | Network port that the database cluster is listening on. |
| db_user | Username for the cluster's default user. |
| lb_ip | The Reserved IP assigned to the droplet. |
<!-- END_TF_DOCS -->