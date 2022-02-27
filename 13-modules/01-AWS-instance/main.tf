data "aws_key_pair" "terraform_key_pair" {
  key_name = var.key_pair_name
}

resource "aws_security_group" "ssh_access" {
  name        = "SG_Terraform"
  description = "Security Group created by terraform"
  ingress = [{
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow Access from the internet. It is not recommended!"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  },
  {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow Access from the internet."
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "terraform_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.terraform_key_pair.key_name
  tags = {
    Name = "Instance Created By Terraform"
  }
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
}