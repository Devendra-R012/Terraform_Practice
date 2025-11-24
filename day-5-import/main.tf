resource "aws_instance" "name" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "PROJECT"
  tags = {
    Name = "IMPORT"
  }
}


#to import resource..
#terraform import aws_instance.name <instance_id>