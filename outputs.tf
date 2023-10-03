# Domain Outputs

# Networking Outputs

# Networking Outputs
output "lb_ip" {
  description = "The Reserved IP assigned to the droplet."
  value       = [for lb in digitalocean_loadbalancer.public : lb.ip]
}
