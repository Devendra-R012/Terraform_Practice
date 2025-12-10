resource "aws_instance" "dev" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "PROJECT"
  subnet_id              = "subnet-0dc0c4f204ee0c5cb"
  associate_public_ip_address = true
  user_data = file ("test.sh")
  tags = {
    Name = "dev_ec2"
  }
}