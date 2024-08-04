
resource "aws_eks_node_group" "private-nodes" {
    cluster_name = aws_eks_cluster.vijay-eks-cluster.name
    node_group_name = "private-nodes"
    node_role_arn = aws_iam_role.eks_ng_role.arn

    subnet_ids = [
        aws_subnet.private-us-east-1a.id,
        aws_subnet.private-us-east-1b.id
    ]

    capacity_type = "SPOT"
    instance_types = ["t2.small"]

    scaling_config {
      desired_size = 1
      max_size = 2
      min_size = 0
    }

    update_config {
      max_unavailable = 1
    }

    labels = {
      role = "eks-general"
    }

    timeouts {
      create = "10m"
      update = "10m"
      delete = "10m"  
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.vijay-eks-cni_clusterpolicy,
        aws_iam_role_policy_attachment.vijay-eks-ecr_clusterpolicy,
        aws_iam_role_policy_attachment.vijay-eks-ng_clusterpolicy 
    ]
}