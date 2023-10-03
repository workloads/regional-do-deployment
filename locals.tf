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
    "workloads",
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

  inbound_rule_db = var.enable_db_con ? [{
    protocol         = "tcp"
    port_range       = "5432"
    source_addresses = var.db_ip_range
  }] : []

  inbound_rule = concat(
    local.inbound_rule_ssh,
    local.inbound_rule_db
  )

  ssh_ip_range_spaces = var.ssh_ip_range == ["0.0.0.0/0"] ? [] : var.ssh_ip_range

  ssh_fingerprints = var.ssh_keys != [""] ? var.ssh_keys : [digitalocean_ssh_key.this[0].fingerprint]
}
