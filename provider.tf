terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
 region    = "${var.region}"
}

terraform {
  backend "s3" {
    bucket         = "terraformstatebucket9966"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-dev"
    acl            = "private"
    encrypt        = "true"
  }
}

