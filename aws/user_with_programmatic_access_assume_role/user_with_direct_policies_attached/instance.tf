/*
!! Important !!
* Currently the AWS secrets(AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY) used for authentication to terraform is 
* from the user which has direct policies [AmazonVPCFullAccess,AmazonEC2FullAcces]  attached to it
*/

data "aws_vpc" "default" {

  default = true
}
resource "aws_key_pair" "eks_jump_host" {

  key_name   = "ec2keypair"
  public_key = file("${path.module}/../ec2keypair.pub")
}

# Example from https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
data "aws_ami" "ubuntu" {

  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}
resource "aws_instance" "terraform-ec2" {

  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  key_name        = "ec2keypair"
  security_groups = [aws_security_group.t-allow_tls.name]
}
resource "aws_security_group" "t-allow_tls" {

  name        = "allow-80-22"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

