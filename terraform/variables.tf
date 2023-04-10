#--------------------------------------------------------------------------#
#                             Variables
#--------------------------------------------------------------------------#
variable "environment" {
  description = "Environment for the resources"
}

variable "project_name" {
  description = "Project name"
}

variable "github_token_for_frontend" {
  description = "Github personal access token for amplify to access the frontend repo"
}

variable "state_bucket" {
    description = "name of the s3 bucket to store s3 state in"
}

variable "region" {
    description = "AWS region"
}

variable "github_repository" {
    description = "http link of the github repo"
}

variable "enable_basic_auth" {
    description = "Enable Authentication for the Amplify App"
}

variable "basic_auth_username" {
    description = "Username of Amplify App Authentication"

}
variable "basic_auth_password" {
    description = "Username of Amplify App Authentication"

}
variable "amplify_app_name" {
    description = "Name of Amplify App"

}
variable "branch_name" {
    description = "Branch name with which this app is build"
}

#--------------------------------------------------------------------------#
#                             Variables
#--------------------------------------------------------------------------#
