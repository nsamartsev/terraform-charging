provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  region = "ca-central-1"
  alias  = "Canada"

# Using another account in canada region
#   assume_role {
#     role_arn     = "arn:aws:iam::123456789012:role/RemoteAdministrator"
#     session_name = "random_session_text"
#   }
}

# =============================================================


data "aws_ami" "canada_latest_ubuntu" {
  provider    = aws.Canada
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

data "aws_ami" "frankfurt_latest_ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

# =============================================================

resource "aws_instance" "my_default_server" {
  instance_type = "t3.micro"
  ami           = data.aws_ami.frankfurt_latest_ubuntu.id
  tags = {
    "Name" = "Frankfurt Server"
  }
}

resource "aws_instance" "my_canada_server" {
  provider      = aws.Canada
  instance_type = "t3.micro"
  ami           = data.aws_ami.canada_latest_ubuntu.id
  tags = {
    "Name" = "Canada Server"
  }
}


