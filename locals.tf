locals {
  regions = setsubtract(data.digitalocean_regions.available.regions[*].slug, var.no_regions)

  count = range(var.num_droplets)

  num_droplets = distinct(flatten([
    for slugs in local.regions : [
      for num in local.count : {
        slugs = slugs
        num   = num
      }
    ]
  ]))

  default_tags = [
    "digitalocean",
    lower(var.project_identifier),
    "terraform"
  ]

  tags = concat(
    local.default_tags,
    var.tags
  )

  inbound_rule_ssh = var.enable_ssh ? [{
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.ssh_ip_range
  }] : []

  inbound_rule = concat(
    local.inbound_rule_ssh
  )

  ssh_fingerprints = var.ssh_keys != [""] ? var.ssh_keys : [digitalocean_ssh_key.main[0].fingerprint]
}
