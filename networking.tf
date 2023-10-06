resource "digitalocean_loadbalancer" "public" {
  for_each = local.regions

  name        = "${var.project_identifier}-lb-${each.value}"
  region      = each.value
  droplet_tag = "${var.project_identifier}-${each.value}"

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 443
    target_protocol = "https"

    tls_passthrough = true
  }
}
