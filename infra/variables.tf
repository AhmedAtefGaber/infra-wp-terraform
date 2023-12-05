variable "region" {
  type        = string
  description = "Region to deploy resources to"
  default     = "us-east-1"
}

variable "env" {
  type        = string
  description = "Environment to provision the IAC"
  default     = "dev"
}

variable "vpc_cidr" {
  type        = string
  description = "The cidr_block of the VPC"
  default     = "10.0.0.0/16"
}

variable "private_subnet_1a_cidr" {
  type        = string
  description = "The cidr_block of private-me-south-1a subnet"
  default     = "10.0.0.0/19"
}

variable "private_subnet_1b_cidr" {
  type        = string
  description = "The cidr_block of private-me-south-1b subnet"
  default     = "10.0.32.0/19"
}

variable "private_subnet_1c_cidr" {
  type        = string
  description = "The cidr_block of private-me-south-1c subnet"
  default     = "10.0.64.0/19"
}

variable "public_subnet_1a_cidr" {
  type        = string
  description = "The cidr_block of public-me-south-1a subnet"
  default     = "10.0.96.0/19"
}

variable "public_subnet_1b_cidr" {
  type        = string
  description = "The cidr_block of public-me-south-1b subnet"
  default     = "10.0.128.0/19"
}

variable "public_subnet_1c_cidr" {
  type        = string
  description = "The cidr_block of public-me-south-1c subnet"
  default     = "10.0.160.0/19"
}

variable "eks_name" {
  type        = string
  description = "The name of the EKS cluster"
  default     = "eks-dev-iac"
}

variable "eks_version" {
  type        = string
  description = "The version of the EKS cluster"
}

variable "instance_types" {
  type        = list(string)
  description = "instance types of nodes in eks"
}

variable "eks_desired_size" {
  type        = number
  description = "The desired_size of the EKs cluster"
}

variable "eks_min_size" {
  type        = number
  description = "The min_size of the EKs cluster"
}

variable "eks_max_size" {
  type        = number
  description = "The max_size of the EKs cluster"
}

variable "disk_size" {
  type        = number
  description = "The size of Disks of nodes in eks"
  default     = 20
}

variable "bastion_instance_type" {
  type        = string
  description = "Instance type of bastion host"
}

variable "bastion_ami_id" {
  type        = string
  description = "ami_id of bastion host"
}

variable "users_keys" {
  type        = list(any)
  description = "{user_name = \"\" user_key = \"\", user_name = \"\" user_key = \"\",...}"
}

variable "hosted_zone" {
    type        = string
  description = "hosted_zone name"
}
