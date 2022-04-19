resource "aws_instance" "terraform_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "Instance Created By Terraform"
  }
  vpc_security_group_ids = [aws_security_group.ssh_web_access.id]
}

resource "aws_security_group" "ssh_web_access" {
  name        = "SG_Terraform"
  description = "Security Group created by terraform"
  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {
      from_port = port.value
      to_port = port.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "to_ports" {
  value = aws_security_group.ssh_web_access.ingress[*].to_port
}