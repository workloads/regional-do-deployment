resource "digitalocean_loadbalancer" "public" {
  for_each = local.regions

  name        = "workloads-lb-${each.value}"
  region      = each.value
  droplet_tag = "workloads-${each.value}"

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert["${each.value}"].name
  }

  # TODO: map this to Nomad :4646 health API
  # healthcheck {
  #   port                   = 80
  #   path                   = "/api/health"
  #   protocol               = "http"
  #   check_interval_seconds = 3
  #   unhealthy_threshold    = 2
  #   healthy_threshold      = 2
  # }
}

resource "digitalocean_record" "a_record" {
  for_each = local.regions

  domain = "${each.value}.workloads.${var.domain}"
  type   = "A"
  name   = "workloads"
  value  = digitalocean_loadbalancer.public["${each.value}"].ip
}
