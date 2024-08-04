resource "aws_iam_role" "eks_role" {
  name = "eks_cluster_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "eks_cluster_role"
  }
}

resource "aws_iam_role_policy_attachment" "vijay-eks-clusterpolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks_role.name
  
}

#Node Group Policy

resource "aws_iam_role" "eks_ng_role" {
  name = "eks_cluster_ng_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "eks_cluster_ng_role"
  }
}

resource "aws_iam_role_policy_attachment" "vijay-eks-ng_clusterpolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.eks_ng_role.name
  
}

resource "aws_iam_role_policy_attachment" "vijay-eks-cni_clusterpolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.eks_ng_role.name
  
}

resource "aws_iam_role_policy_attachment" "vijay-eks-ecr_clusterpolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks_ng_role.name
  
}