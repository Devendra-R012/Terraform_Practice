provider "aws" {
    region = "us-west-1"
  
}
# 1. Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0623300d1b7caee89"   # Amazon Linux 2 AMI (update for your region)
  instance_type = "t2.micro"

  tags = {
    Name = "MyExampleInstance"
  }
}

# 2. Null resource to run a local command after EC2 is created
resource "null_resource" "after_ec2" {
#   This ensures the null_resource depends on the EC2 instance
  depends_on = [aws_instance.example]

  provisioner "local-exec" {
    command = "echo EC2 instance ${aws_instance.example.id} created successfully!"

  }
}

