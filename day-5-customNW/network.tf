#create VPC

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "test_server"
    } 
}

#create subnets

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
tags = {
  Name = "public_subnet"
}
  
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
tags = {
  Name = "private_subnet"
}
}

#create Internet gateway and attach to VPC

resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id

}
#allocate elastic IP for NAT gateway

resource "aws_eip" "dev" {
  domain = "vpc"
  
}


#create NAT gateway
resource "aws_nat_gateway" "dev" {
  allocation_id = aws_eip.dev.id
  subnet_id     = aws_subnet.public.id
}

#create route table and Edit routes

resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
      route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.dev.id
    }
  
}

#create route table and Edit routes for NAT

resource "aws_route_table" "nat" {
    vpc_id = aws_vpc.dev.id
      route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.dev.id
    }
}

#subnet association to route
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.public.id
}

#Subnet association for NAT gateway

resource "aws_route_table_association" "nat" {
    route_table_id = aws_route_table.nat.id
    subnet_id = aws_subnet.private.id

}

#create SG group
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.dev.id
    tags = {
      Name = "dev_sg"
    }
   ingress {
    description = "TLS from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }
   ingress {
    description = "TLS from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

   }
  
}

