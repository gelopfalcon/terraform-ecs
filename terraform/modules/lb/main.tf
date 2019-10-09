resource "aws_alb" "rda-maxar-lb" {
    name                = var.alb_name
    security_groups     = var.security_groups 
    subnets             = var.subnets

    tags = {
      Name = "rda-maxar-lb"
    }
}

resource "aws_alb_target_group" "rda-maxar-alb-tg" {
    name                = var.alb_target_group_name
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = var.vpc_id

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags = {
      Name = "rda-maxar-alb-target-group"
    }

    depends_on = ["aws_alb.rda-maxar-lb"]
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.rda-maxar-lb.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.rda-maxar-alb-tg.arn}"
        type             = "forward"
    }
}