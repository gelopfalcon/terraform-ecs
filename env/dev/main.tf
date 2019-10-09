
provider "aws" {
  profile    = "PROFILE_HERE"
  region     = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
  cidr_block_vpc = "10.0.0.0/16"
  availability_zone = "us-east-1a"
  cidr_block_subnet_1 = "10.0.0.0/24"
  cidr_block_subnet_2 = "10.0.1.0/24"
}

module "lb" {
  source = "../../modules/lb"
  alb_name = "RDA-Maxar-ALB"
  alb_target_group_name = "RDA-Maxar-Target-Group"
  security_groups = [module.vpc.security_group_id]
  subnets = [module.vpc.subnet_id_1, module.vpc.subnet_id_2]
  vpc_id = module.vpc.id
}


module "ecs" {
  vpc_id = module.vpc.id
  source = "../../modules/ecs"
  ecs_cluster = "RDA_ECS_cluster"
  ecs-service-name = "RDA_service_nginx"
  ecs-service-role-arn = module.ec2.ecs-service-role-arn
  ecs-target-group-arn = module.lb.alb_target_group-arn
}

module "ec2" {
  source = "../../modules/ec2"
  subnets = [module.vpc.private_subnet_id_1, module.vpc.private_subnet_id_2]
  vpc-id = module.vpc.id
  security-group-id = module.vpc.security_group_id
  autoscaling-group-name = "RDA Auto scaling group"
}