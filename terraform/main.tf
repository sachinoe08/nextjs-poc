# Provider Configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  region = var.region
  #  region     = "us-east-1"
  #  access_key = "AKIAJTTSSUF2PB6HDCCA"
  #  secret_key = "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"
}

#resource "aws_s3_bucket" "terraform_state" {
#  bucket = "foundersnetwork-state"
#   # Prevent accidental deletion of this S3 bucket
#  lifecycle {
#    prevent_destroy = true
#}
#}
#resource "aws_s3_bucket_versioning" "versioning_terraform_state" {
#  bucket = aws_s3_bucket.terraform_state.id
#  versioning_configuration {
#    status = "Enabled"
#  }
#}