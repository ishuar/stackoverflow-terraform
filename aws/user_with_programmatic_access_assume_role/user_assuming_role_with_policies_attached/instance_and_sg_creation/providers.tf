terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {

  alias  = "ec2_and_vpc_full_access"
  region = "eu-central-1"

  assume_role {
    role_arn = data.aws_iam_role.stackoverflow.arn
  }
}
