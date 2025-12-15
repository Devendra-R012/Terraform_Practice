# Key Pair
resource "aws_key_pair" "example" {
  key_name   = "task"
  public_key = file("~/.ssh/id_ed25519.pub")
}


resource "aws_instance" "server" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name        = aws_key_pair.example.key_name
  subnet_id              = "subnet-0dc0c4f204ee0c5cb"
  associate_public_ip_address = true
  tags = {
    Name = "key-tf"
  }
  
}