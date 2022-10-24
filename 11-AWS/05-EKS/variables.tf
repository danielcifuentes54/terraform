variable "region" {
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster Name"
  default     = "devops-eks-cluster"
}

variable "kubernetes_api_allowed_ip" {
  type        = list(string)
  description = "Ip's addresses that will be allowed to connect to the Kubernetes API"
  default     = ["0.0.0.0/0"]
}