#create public Servers
resource "aws_instance" "dev" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "PROJECT"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  tags = {
    Name = "dev_ec2"

  }

}

#create Private Server