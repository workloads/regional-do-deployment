# Networking Outputs
output "lb_ip" {
  description = "The Reserved IP assigned to the droplet."
  value       = [for lb in digitalocean_loadbalancer.public : lb.ip]
}

# Compute Outputs
output "droplet_id" {
  description = "The ID of the Droplet."
  value       = [ for drop in digitalocean_droplet.main : drop.id ]
}

output "droplet_ipv4" {
  description = "The IPv4 address of the Droplet."
  value       = [ for drop in digitalocean_droplet.main : drop.ipv4_address ]
}
