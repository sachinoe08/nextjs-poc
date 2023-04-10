variable "environment" {
  description = "Environment for the resources"
}

variable "project_name" {
  description = "Project name"
}

variable "github_token_for_frontend" {
    description = "Github personal access token for amplify to access the frontend repo"
}

#variable "domain" {
#  description = "Domain"
#}

variable "github_repository" {
  description = "HTTP link of the git repo"
}

variable "enable_basic_auth" {}
variable "basic_auth_username" {}
variable "basic_auth_password" {}
variable "branch_name" {}