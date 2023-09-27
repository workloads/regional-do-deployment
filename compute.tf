resource "digitalocean_droplet" "this" {
  for_each = { for entry in local.num_droplets : "${entry.num}.${entry.slugs}" => entry }

  image      = data.digitalocean_images.available.images[0].id
  name       = "workloads-droplet-${each.value.slugs}-${each.value.num}"
  region     = each.value.slugs
  size       = var.droplet_size
  monitoring = true
  backups    = var.droplet_backups
  ssh_keys   = local.ssh_fingerprints
  tags       = concat(
                local.tags,
                ["workloads-${each.value.slugs}"]
               )
}

resource "digitalocean_ssh_key" "this" {
  count = var.ssh_pub_file == "" ? 0 : 1

  name       = "Workloads Droplet SSH Key"
  public_key = file(var.ssh_pub_file)
}

resource "digitalocean_firewall" "this" {
  for_each = { for entry in local.num_droplets : "${entry.num}.${entry.slugs}" => entry }

  name = "workloads-${each.value.slugs}-${each.value.num}"

  droplet_ids = [digitalocean_droplet.this["${each.value.num}.${each.value.slugs}"].id]

  tags = local.tags

  dynamic "inbound_rule" {
    for_each = local.inbound_rule == null ? [] : local.inbound_rule

    content {
      protocol                  = inbound_rule.value.protocol
      port_range                = inbound_rule.value.port_range
      source_addresses          = inbound_rule.value.source_addresses
    }
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}