provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name  = element(var.aws_users, count.index)
}

resource "aws_instance" "servers" {
  count         = 3
  ami           = "ami-0caef02b518350c8b"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Server number ${count.index + 1}"
  }
}