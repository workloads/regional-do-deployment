module "main" {
  source = "../.."

  do_token = var.do_token
  project_identifier = var.project_identifier
  tfe_organization = var.tfe_organization
  tfe_workspace    = var.tfe_workspace

  no_regions = var.no_regions
  ssh_keys   = var.ssh_keys
  tags = var.tags
  ssh_ip_range = var.ssh_ip_range
}

output "module" {
  description = "Outputs from module"
  value       = module.main
}