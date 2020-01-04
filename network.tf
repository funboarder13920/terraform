/*
  All resources related to the VPC and network infrastructure
*/

# Main VPC
resource "aws_vpc" "default" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "default"
    service = "network"
  }
}


# Internet gateway to connect VPC to the internet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id

  tags = {
    service = "network"
  }
}

# Public subnets in each AZ
resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.default.id
  availability_zone       = "eu-west-2a"
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-a"
    service = "network"
  }
}

resource "aws_subnet" "public-b" {
  vpc_id                  = aws_vpc.default.id
  availability_zone       = "eu-west-2b"
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-b"
    service = "network"
  }
}

resource "aws_subnet" "public-c" {
  vpc_id                  = aws_vpc.default.id
  availability_zone       = "eu-west-2c"
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-c"
    service = "network"
  }
}
