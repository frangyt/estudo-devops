terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {  
  region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = [ "sg-02a36b4677a378fa0" ]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Permite conexao ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.104.12.210/32"]    
  }

  tags = {
    Name = "allow_ssh"
  }
}