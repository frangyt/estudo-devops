resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Permite conexao ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto   
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = aws.us-east-2
  name        = "acesso-ssh"
  description = "Permite conexao ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdirs_acesso_remoto   
  }

  tags = {
    Name = "allow_ssh"
  }
}