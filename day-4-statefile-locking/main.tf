resource "aws_instance" "dev" {
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t2.micro"
  key_name      = "PROJECT"
  subnet_id     = "subnet-0628de8b91dc7aab1"
  tags = {
    Name = "TEST"
  }

}