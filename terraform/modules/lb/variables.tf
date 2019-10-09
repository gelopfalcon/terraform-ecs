variable "alb_name" {
  type        = string
  description = "Application Load Balancer name"
}

variable "alb_target_group_name" {
  type        = string
  description = "Application LB target group name"
}

variable "security_groups" {
  type        = list(string)
  description = "Security Groups"
}

variable "subnets" {
  type        = list(string)
  description = "Subnets"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}