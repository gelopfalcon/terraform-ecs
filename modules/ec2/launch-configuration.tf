resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                        = "${var.launch-configuration-name}"
    image_id             =      "ami-084f07d75acedcefa"
    instance_type               = "t2.xlarge"
    iam_instance_profile        = "${aws_iam_instance_profile.ecs-instance-profile.name}" 
    security_groups             = ["${var.security-group-id}"]
    associate_public_ip_address = "true"
    user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=RDA_ECS_cluster >> /etc/ecs/ecs.config
                                  EOF
}

data "aws_ami" "ecs_optimized" {
  owners = ["amazon"] 
  filter {
    name   = "name"
    values = ["amzn-ami-2017.09.l-amazon-ecs-optimized"]
  }
}