resource "aws_instance" "dev" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "PROJECT"
  subnet_id              = "subnet-0dc0c4f204ee0c5cb"
  tags = {
    Name = "dev_ec2"

  }
#   lifecycle {
#     create_before_destroy = true #create first then delete
#   }

#   lifecycle {
#     ignore_changes = [ tags, ]

#   }

#   lifecycle {
#     prevent_destroy = true
#   }

}