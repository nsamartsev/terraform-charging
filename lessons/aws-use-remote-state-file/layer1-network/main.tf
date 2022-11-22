provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "aws-infra-dev-ftstate-storage"
    key    = "dev/network/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "aws_availability_zones" "available_zones" {}
