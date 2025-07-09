provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2_instances" {
  for_each = var.instances

  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = each.key
  }
}
