#--------------------------------------------------------------------------#
#                         Amplify App Module Configuration
#--------------------------------------------------------------------------#
module "frontend" {
  source = "./modules/frontend"
  environment  = var.environment
  project_name = var.project_name
  github_repository = var.github_repository
  github_token_for_frontend = var.github_token_for_frontend
  enable_basic_auth = var.enable_basic_auth
  basic_auth_username = var.basic_auth_username
  basic_auth_password = var.basic_auth_password
  branch_name = var.branch_name
}
#--------------------------------------------------------------------------#
#                         Amplify App Module Configuration
#--------------------------------------------------------------------------#