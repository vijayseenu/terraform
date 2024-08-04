resource "aws_route_table" "eks-route-private" {
  vpc_id = aws_vpc.main.id

  route {
    #cidr_block = "10.0.1.0/26"
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks-nat-gw.id
  }


  tags = {
    Name = "Private-eks"
  }
}

resource "aws_route_table" "eks-route-public" {
  vpc_id = aws_vpc.main.id

  route {
    #cidr_block = "10.0.64.0/26"
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "Public-eks"
  }
}

resource "aws_route_table_association" "rt-private-us-east-1a" {
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.eks-route-private.id
}

resource "aws_route_table_association" "rt-private-us-east-1b" {
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.eks-route-private.id
}

resource "aws_route_table_association" "rt-public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.eks-route-public.id
}

resource "aws_route_table_association" "rt-public-us-east-1b" {
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.eks-route-public.id
}

