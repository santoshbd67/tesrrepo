provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "test-vpc" {
  cidr_block = "128.0.0.0/16"

  tags = {
    Name = "test-vpc"
  }
}
resource "aws_subnet" "test-subnet" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "128.0.0.0/16"

  tags = {
    Name = "test-subnet"
  }
}
resource "aws_route_table" "rt-test" {
  vpc_id = aws_vpc.test-vpc.id

  route = []

  tags = {
    Name = "rt-test"
  }
}
resource "aws_internet_gateway" "igw-test" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "igw-test"
  }
}
resource "aws_instance" "test-instance" {
  ami             = "ami-0230bd60aa48260c6"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.test-subnet.id
  key_name        = "terraform-test"
  tags = {
    Name = "test-nstance"
  }
}