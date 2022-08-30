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
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_instance" "dev4" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
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

resource "aws_s3_bucket" "dev4" {
  bucket = "fran-dev4"

  tags = {
    Name = "fran-dev4"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}