resource "aws_instance" "dev" {
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  tags = {
    Name = "TEST"
  }

}
