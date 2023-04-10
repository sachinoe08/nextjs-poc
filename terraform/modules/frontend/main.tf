locals {
  basic_auth_creds = try(base64encode("${var.basic_auth_username}:${var.basic_auth_password}"), null)
}

resource "aws_iam_role" "amplify_role" {
  name = "amplify_deploy_terraform_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "amplify.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_role_policy" "amplify_role_policy" {
  name = "amplify_iam_role_policy"
  role = aws_iam_role.amplify_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("${path.cwd}/modules/frontend/amplify_role_policies.json")
}


resource "aws_amplify_app" "foundersnetwork" {
  name = "${var.project_name}-${var.environment}"
  repository = var.github_repository
  access_token= var.github_token_for_frontend

  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm ci
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: .next
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT




#  build_spec = <<-EOT
#    version: 1
#    frontend:
#      phases:
#        preBuild:
#          commands:
#            - npm ci
#        build:
#          commands:
#            - npm run build
#      artifacts:
#        baseDirectory: out
#        files:
#          - '**/*'
#      cache:
#        paths:
#          - node_modules/**/*
#  EOT




  enable_basic_auth      = var.enable_basic_auth
  basic_auth_credentials = local.basic_auth_creds
  enable_auto_branch_creation = true
  enable_branch_auto_build = true
  enable_branch_auto_deletion = true

#platform (string) – The platform for the Amplify app. 
#For a static app, set the platform type to WEB. 
#For a dynamic server-side rendered (SSR) app, set the platform type to WEB_COMPUTE.
#For an app requiring Amplify Hosting’s original SSR support only, set the platform type to WEB_DYNAMIC.

#When you deploy a Next.js app, Amplify Hosting detects the settings in your app and sets the internal platform value for the app.
#There are three valid platform values. An SSG app is set to the platform value WEB. 
#An SSR app using Next.js version 11 is set to the platform value WEB_DYNAMIC.
#A Next.js 12 or later SSR app is set to the platform value WEB_COMPUTE.

#When you migrate an app using the instructions in the previous section, Amplify changes the platform value of your app from WEB_DYNAMIC to WEB_COMPUTE.
#After the migration to Amplify Hosting compute is complete, you can't revert the migration in the console.
#To revert the migration, you must use the AWS Command Line Interface to change the app's platform back to WEB_DYNAMIC. 
#Open a terminal window and enter the following command, updating the text in red with your unique app id and Region.


#  platform = "WEB_DYNAMIC"
  platform = "WEB_COMPUTE"

  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]

  auto_branch_creation_config {
    enable_pull_request_preview = true
#    environment_variables = {
#      APP_ENVIRONMENT = "dev"
#    }
  }

  iam_service_role_arn = aws_iam_role.amplify_role.arn

  #Amplify will automatically add custom_rules after initial deployment. This ensures your subsequent terraform runs don't break your amplify deployment.
  lifecycle {
    ignore_changes = [
      custom_rule,
    ]
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

# map git branches to amplify
#- - - - - - - - - - - - - - -- - - -- - - - - -- - - - - - -
resource "aws_amplify_branch" "dev" {
  app_id      = aws_amplify_app.foundersnetwork.id
  branch_name = var.branch_name

  enable_auto_build = true

  framework = "Next.js - SSR"
  stage     = "DEVELOPMENT"

  environment_variables = {
    APP_ENVIRONMENT = "dev"
  }
}

#resource "aws_amplify_branch" "uat" {
#  app_id      = aws_amplify_app.foundersnetwork.id
#  branch_name = "uat"

#  enable_auto_build = true

#  framework = "Next.js - SSR"
#  stage     = "PRODUCTION"

#  environment_variables = {
#    APP_ENVIRONMENT = "uat"
#  }
#}

#resource "aws_amplify_branch" "prod" {
#  app_id      = aws_amplify_app.foundersnetwork.id
#  branch_name = "prod"

#  enable_auto_build = true

#  framework = "Next.js - SSR"
#  stage     = "PRODUCTION"

#  environment_variables = {
#    APP_ENVIRONMENT = "prod"
#  }
#}

#- - - - - - - - - - - - - - -- - - -- - - - - -- - - - - - -

resource "aws_amplify_webhook" "dev" {
  app_id      = aws_amplify_app.foundersnetwork.id
  branch_name = aws_amplify_branch.dev.branch_name
  description = "amplify-hook-main"
}

#resource "aws_amplify_webhook" "uat" {
#  app_id      = aws_amplify_app.foundersnetwork.id
#  branch_name = aws_amplify_branch.uat.branch_name
#  description = "amplify-hook-main"
#}

#resource "aws_amplify_webhook" "prod" {
#  app_id      = aws_amplify_app.foundersnetwork.id
#  branch_name = aws_amplify_branch.prod.branch_name
#  description = "amplify-hook-main"
#}