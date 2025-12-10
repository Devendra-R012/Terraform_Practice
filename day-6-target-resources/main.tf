
resource "aws_instance" "dev" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "PROJECT"
  subnet_id              = "subnet-0dc0c4f204ee0c5cb"
  tags = {
    Name = "dev_ec2"
  }
}
  resource "aws_s3_bucket" "name" {
    bucket = "hvdudvwgdvwugdcubbwdss"
}


#targeted resource we can use to apply specific resource level only below command is the reference 

#terraform apply -target=aws_s3_bucket.name