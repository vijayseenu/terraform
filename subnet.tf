resource "aws_subnet" "private-us-east-1a" {
  vpc_id     = aws_vpc.main.id
  #cidr_block = "10.0.1.0/26"
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-us-east-1a"
    "kubernetes.io/role/internal-elb" = "a"
    "kubernetes.io/cluster/vijay-eks-cluster" = "owned"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id     = aws_vpc.main.id
  #cidr_block = "10.0.32.0/26"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-us-east-1b"
    "kubernetes.io/role/internal-elb" = "a"
    "kubernetes.io/cluster/vijay-eks-cluster" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id     = aws_vpc.main.id
  #cidr_block = "10.0.64.0/26"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1a"
    "kubernetes.io/role/internal-elb" = "a"
    "kubernetes.io/cluster/vijay-eks-cluster" = "owned"
  }
}


resource "aws_subnet" "public-us-east-1b" {
  vpc_id     = aws_vpc.main.id
  #cidr_block = "10.0.96.0/26"
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-1b"
    "kubernetes.io/role/internal-elb" = "a"
    "kubernetes.io/cluster/vijay-eks-cluster" = "owned"
  }
}