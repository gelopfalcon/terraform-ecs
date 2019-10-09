variable "ecs_cluster" {
  type        = string
  description = "ECS Cluster name"
}

variable "ecs-service-name" {
  type        = string
}

variable "ecs-service-role-arn" {
  type        = string
}

variable "ecs-target-group-arn" {
  type        = string
  description = ""
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}

variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "availability_zone" {
  type        = string
  default     = "us-east-1a"
  description = "Availability zone based on region"
}