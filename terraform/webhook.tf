# ADD Branch setup to new AWS Amplify APP Resource
resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.foundersnetwork.id
  branch_name = "main"

  stage               = "PRODUCTION"
  enable_notification = true
}
# ADD Webhooks
resource "aws_amplify_webhook" "main" {
  app_id      = aws_amplify_app.foundersnetwork.id
  branch_name = aws_amplify_branch.main.branch_name
  description = "amplify-hook-main"
}


#resource "aws_amplify_branch" "develop" {
#  app_id      = aws_amplify_app.foundersnetwork.id
#  branch_name = "develop"
#
#  stage               = "DEVELOPMENT"
#  enable_notification = true

#}

#resource "aws_amplify_webhook" "DEVELOPMENT" {
#  app_id      = aws_amplify_app.foundersnetwork.id
#  branch_name = aws_amplify_branch.develop.branch_name
#  description = "amplify-hook-develop"
#}