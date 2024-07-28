# see https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/regions
data "digitalocean_regions" "available" {
  filter {
    key    = "available"
    values = ["true"]
  }

  filter {
    key    = "sizes"
    values = [var.droplet_size]
  }

  sort {
    key       = "name"
    direction = "desc"
  }
}

data "digitalocean_images" "available" {
  filter {
    key    = "distribution"
    values = ["Ubuntu"]
  }

  filter {
    key    = "regions"
    values = data.digitalocean_regions.available.regions[*].slug
  }

  sort {
    key       = "created"
    direction = "desc"
  }
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace
data "tfe_workspace" "main" {
  provider = tfe.viewer

  name         = var.tfe_workspace
  organization = var.tfe_organization
}
