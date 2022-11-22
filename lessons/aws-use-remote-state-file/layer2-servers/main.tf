provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "aws-infra-dev-ftstate-storage"
    key    = "dev/servers/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "aws-infra-dev-ftstate-storage"
    key    = "dev/network/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
