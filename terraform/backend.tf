#--------------------------------------------------------------------------#
#                       Terraform Backend State Setting
#--------------------------------------------------------------------------#
terraform {
  backend "s3" {
    bucket = "foundersnetwork-backend-state"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}

# s3 for terraform state
locals {
  aws_s3_bucket_id = var.state_bucket
}

#Below code is commented as You have create S3 Bucket manually.
#resource "aws_s3_bucket" "terraform_state" {
#  bucket = var.state_bucket
#  tags = {
#    Environment = var.environment
#  }
#}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = local.aws_s3_bucket_id 
  versioning_configuration {
    status =   "Enabled"
  }
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = local.aws_s3_bucket_id
  acl    = "private"
}

#--------------------------------------------------------------------------#
#                       Terraform Backend State Setting
#--------------------------------------------------------------------------#