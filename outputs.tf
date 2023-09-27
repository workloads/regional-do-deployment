# Domain Outputs

# Networking Outputs

# Storage Outputs
output "bucket_name" {
  description = "Name of the Spaces Bucket."
  value       = [ for bucket in digitalocean_spaces_bucket.this : bucket.bucket_domain_name ]
}

# Networking Outputs
output "lb_ip" {
  description = "The Reserved IP assigned to the droplet."
  value       = [ for lb in digitalocean_loadbalancer.public : lb.ip ]
}

# Database Outputs
output "db_port" {
  description = "Network port that the database cluster is listening on."
  value       = [ for db_cluster in digitalocean_database_cluster.this : db_cluster.port ]
}

output "db_host" {
  description = "Database cluster's hostname."
  value       = [ for db_cluster in digitalocean_database_cluster.this : db_cluster.host ]
}

output "db_user" {
  description = "Username for the cluster's default user."
  value       = [ for db_cluster in digitalocean_database_cluster.this : db_cluster.user ]
}

output "db_password" {
  description = "Password for the cluster's default user."
  value       = [ for db_cluster in digitalocean_database_cluster.this : db_cluster.password ]
  sensitive = true
}

output "database" {
  description = "Name of the cluster's default database."
  value       = [ for db_cluster in digitalocean_database_cluster.this : db_cluster.database ]
}

# Compute Outputs