terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # The Terraform Cloud configuration will be retrieved from the executing environment
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/digitalocean/digitalocean/2.34.1/
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.34.1, < 3.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.7.0, < 2.0.0"
}
