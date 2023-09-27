############
# Choose between local or cloud state storage
############

# IMP. If using local state file management make sure you DO NOT upload your state file in version control as this stores sensitive data
# ONLY FOR LOCAL DEVELOPMENT
terraform {
  backend "local" {
    path = "./compute.tfstate"
  }
}

# # If you decide to store your state file within Terraform Cloud
# # - Comment the local backend block above
# # - Uncomment the cloud backend block below and modify the organization and workspaces options
# # - Uncomment the `tf_token` variable block within the `variables.tf` file
# # - Provide the variable value accordingly (IMP. Secrets shouldn't be stored in version control)
# terraform {
#   cloud {
#     organization = "name-of-org"

#     workspaces {
#       tags = ["workloads"]
#     }

#     token = var.tf_token
#   }
# }
