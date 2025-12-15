resource "aws_instance" "dev" {
    ami = "ami-0623300d1b7caee89"
    instance_type = "t2.micro"
    key_name = "task"
    tags = {
      Name = "test"
    }
  
}