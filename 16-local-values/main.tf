resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "m6g.large"
  tags = local.common_tags  
}

resource "aws_instance" "bd" {
  ami           = var.ami
  instance_type = "m6g.medium"
  tags = local.common_tags
}

locals {
  common_tags = {
    Name    = "test from terraform"
    Project = "Terraform"
  }
}