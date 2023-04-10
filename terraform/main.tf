#--------------------------------------------------------------------------#
#                         Provider Configuration
#--------------------------------------------------------------------------#
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
  #  access_key = "AKIAJTTSSUF2PB6HDCCA"
  #  secret_key = "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"
}
#--------------------------------------------------------------------------#
#                         Provider Configuration
#--------------------------------------------------------------------------#