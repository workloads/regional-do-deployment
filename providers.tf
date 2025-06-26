# see https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs
provider "digitalocean" {
  api_endpoint = var.do_api_endpoint

  # TODO: remove when running in TFC
  token = var.do_token

  # The DigitalOcean Provider is set to retrieve configuration from the executing environment
}
