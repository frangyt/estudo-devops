variable "amis" {
  type = map

  default = {
    "us-east-1" = "ami-052efd3df9dad4825"
    "us-east-2" = "ami-0568773882d492fc8"
  }
}

variable "cdirs_acesso_remoto" {
    type = list

    default = ["177.104.12.210/32"]   
}

variable "key_name" {
    type = string

    default = "terraform-aws"  
}