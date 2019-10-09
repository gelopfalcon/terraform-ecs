variable "cidr_block_vpc" {
    type = string
    description = "The CIDR block for the VPC or subnet."
    default = "10.0.0.0/16"
}

variable "cidr_block_route_table" {
    type = string
    description = "The CIDR block for the route table."
    default = "10.0.0.0/0"
}

variable "cidr_block_subnet_1" {
    type = string
    description = "The CIDR block for the subnet."
}

variable "cidr_block_subnet_2" {
    type = string
    description = "The CIDR block for the subnet."
    default = "0.0.0.0/0"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}