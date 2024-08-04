resource "aws_eip" "eks-nat" {
  #instance = aws_instance.web.id
  domain   = "vpc"  

}

resource "aws_nat_gateway" "eks-nat-gw" {
  allocation_id = aws_eip.eks-nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "EKS NAT GW"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}