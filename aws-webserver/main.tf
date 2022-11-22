terraform {
  required_version = ">= 1.2.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}
