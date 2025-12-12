resource "aws_vpc" "dev" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true      # 👈 must be enabled
  enable_dns_hostnames = true      # 👈 must be enabled

  tags = {
    Name = "test_server"
  }
}
resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
tags = {
  Name = "pub-subnet1"
}
  
}
resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = true
tags = {
  Name = "pub-subnet2"
}
  
}
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id

    tags = {
      Name = "dev-igw"
    }

}
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
      route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.dev.id
    }
    tags = {
      Name = "dev-rt"
    }
  
}
resource "aws_route_table_association" "dev1" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.public1.id
}
resource "aws_route_table_association" "dev2" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.public2.id
}
resource "aws_security_group" "security-group" {
    vpc_id = aws_vpc.dev.id

    ingress = [ 
       for port in [22, 8080, 9090, 3360, 80] : {
        description = "TLS from VPC"
        from_port = port
        to_port = port
        protocol = "tcp"
        ipv6_cidr_blocks = ["::/0"]
        self = false
        prefix_list_ids = []
        security_groups = []
        cidr_blocks = ["0.0.0.0/0"]
       }
     ]

     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

     }
  
}