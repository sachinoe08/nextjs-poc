locals {
  basic_auth_creds = try(base64encode("${var.basic_auth_username}:${var.basic_auth_password}"), null)
}

resource "aws_amplify_app" "foundersnetwork" {
  name       = var.amplify_app_name
  repository = var.repository
  enable_basic_auth      = var.enable_basic_auth
  basic_auth_credentials = local.basic_auth_creds
  access_token = var.access_token

  enable_auto_branch_creation = true
  enable_branch_auto_deletion = true
  auto_branch_creation_config {
    enable_auto_build = true
  }


  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    ENV = "test"
  }
  # The default patterns added by the Amplify Console.
  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]
}



