provider "aws" {
  region = "eu-central-1"
}

module "vpc-default" {
  source = "github.com/nsamartsev/terraform-modules/modules/aws/aws_vpc"
  # description = "test description"
}

module "vpc-dev" {
  source               = "github.com/nsamartsev/terraform-modules/modules/aws/aws_vpc"
  env                  = "dev"
  public_subnet_cidrs  = ["100.0.10.0/24"]
  private_subnet_cidrs = ["100.1.10.0/24"]
  owner                = "new owner"
}
