terraform {
  required_version = "~> 1.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }

  # mocking enterprise
  # backend "s3" {
  #   bucket         = "nature-tfstate"
  #   key            = "prod/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  # }
}

provider "aws" {
  profile = "default"
  region  = var.region

  assume_role {
    role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/TerraformDeployRole"
  }

  default_tags {
    tags = {
      Environment     = "Test"
      Project         = "Nature@Cloud"
      ManagedBy = "terraform"
    }
  }
}

data "aws_caller_identity" "current" {}
