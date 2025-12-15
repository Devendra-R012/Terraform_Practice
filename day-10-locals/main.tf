provider "aws" {
    region = "us-west-1"

}

locals {
  region = "us-east-1"
  enivronment = "dev"
  instance_type = "t2.micro"
  ami = "ami-0623300d1b7caee89"
}

resource "aws_instance" "devinst" {
    ami = local.ami
    instance_type = local.instance_type

    tags = {
      Name = "devops"
    }
}