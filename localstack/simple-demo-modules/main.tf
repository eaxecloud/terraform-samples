# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.15.1"
#      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    dynamodb       = "http://192.168.146.179:4566"
#    ec2            = "http://192.168.146.179:4566"
    s3             = "http://192.168.146.179:4566"
    sns            = "http://192.168.146.179:4566"
    sqs            = "http://192.168.146.179:4566"
  }
}

module "s3" {
  source = "./modules/s3"
}

module "sns" {
  source = "./modules/sns"
}

module "sqs" {
  source = "./modules/sqs"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}