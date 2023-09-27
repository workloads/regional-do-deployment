resource "digitalocean_domain" "default" {
  for_each = local.regions

  name       = "${each.value}.workloads.${var.domain}"
}

resource "digitalocean_certificate" "cert" {
  for_each = local.regions
  
  name    = "workloads-le-cert-${each.value}"
  type    = "lets_encrypt"
  domains = ["${each.value}.workloads.${var.domain}"]

  depends_on = [
    digitalocean_domain.default
  ]

  lifecycle {
    prevent_destroy = true
  }
}