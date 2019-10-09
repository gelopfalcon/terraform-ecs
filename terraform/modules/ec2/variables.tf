variable "vpc-id" {}
variable "subnets" {
    type = list(string)
}
variable "security-group-id" {}

//----------------------------------------------------------------------
// Autoscaling Group Variables
//----------------------------------------------------------------------

variable "autoscaling-group-name" {
    description = "The name for the autoscaling group for the cluster."
    type = string
}

variable "max-instance-size" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default     = 5
}

variable "min-instance-size" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default     = 2
}

variable "desired-capacity" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default     = 3
}

variable "health-check-grace-period" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default     = 300
}

//----------------------------------------------------------------------
// Application Load Balancer Variables
//----------------------------------------------------------------------

variable "load-balancer-name" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default     = "ecs-load-balancer"
}

variable "target-group-name" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default     = "ecs-target-group"
}

//----------------------------------------------------------------------
// Launch Configuration Variables
//----------------------------------------------------------------------

variable "launch-configuration-name" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default = "ecs-launch-configuration"
}

variable "image-id" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default = "ami-d61027ad"
}

variable "instance-type" {
    type = string
    description = "The name for the autoscaling group for the cluster."
    default = "t2.medium"
}