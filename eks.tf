resource "aws_eks_cluster" "vijay-eks-cluster" {
    name = "vijay-eks-cluster"
    role_arn = aws_iam_role.eks_role.arn
    vpc_config {
      subnet_ids = [
        aws_subnet.private-us-east-1a.id,
        aws_subnet.private-us-east-1b.id,
        aws_subnet.public-us-east-1a.id,
        aws_subnet.public-us-east-1b.id
      ]
    }
  depends_on = [ aws_iam_role_policy_attachment.vijay-eks-clusterpolicy]
}