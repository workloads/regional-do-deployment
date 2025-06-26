terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/cloud
  cloud {
    # The HCP Terraform configuration will be retrieved from the executing environment
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/digitalocean/digitalocean/2.39.0/
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.39.0, < 3.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.57.0
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.57.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.9.0, < 2.0.0"
}
