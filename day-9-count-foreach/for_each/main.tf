variable "ami" {
  type    = string
  default = "ami-0623300d1b7caee89"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "task"
}
variable "name" {
    type = list(string)
    default = [ "dev", "test", "prod", "count" ]
  
}
resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    for_each = toset(var.name)

    tags = {
      name = each.value
    }

    # count = length(var.name)

    #  tags = {
    #    Name = var.name[count.index]
    #  }

    # tags = {
    #   Name = "test"

    # tags = {
    #   Name = "test-${count.index}"
    # }
    }