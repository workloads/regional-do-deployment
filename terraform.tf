terraform {
  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.5.0, < 2.0.0"

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/digitalocean/digitalocean/2.30.0
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.30.0, < 3.0.0"
    }
    
    # see https://registry.terraform.io/providers/hashicorp/random/3.5.1/
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1, < 4.0.0"
    }
  }
}