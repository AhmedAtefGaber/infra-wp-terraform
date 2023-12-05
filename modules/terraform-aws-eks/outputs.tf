output "endpoint" {
  value     = data.aws_eks_cluster.eks-iac.endpoint
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = base64decode(data.aws_eks_cluster.eks-iac.certificate_authority[0].data)
  sensitive = true
}

output "token" {
  value     = data.aws_eks_cluster_auth.eks-iac.token
  sensitive = true
}

output "iam_role_arn" {
  value       = aws_iam_role.eks_cluster_autoscaler.arn
  description = "this role arn will be used for the service account for cluster autoscaler"
}
