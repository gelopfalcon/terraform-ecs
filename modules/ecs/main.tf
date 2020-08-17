resource "aws_cloudwatch_log_group" "rda_maxar_cloudwatch_log_group" {
  name              = "rda_maxar_cloudwatch_log_group"
  retention_in_days = 1
}

resource "aws_ecs_cluster" "rda_maxar_ecs_cluster" {
    name = var.ecs_cluster
}

resource "aws_ecs_task_definition" "rda-maxar-definition" {
    family                = "mesh-sample-definition"
    container_definitions = "${file("${path.module}/task-definition.json")}"
}

resource "aws_ecs_service" "mesh-ecs-service" {
  	name            = var.ecs-service-name
  	iam_role        = var.ecs-service-role-arn
  	cluster         = "${aws_ecs_cluster.rda_maxar_ecs_cluster.id}"
  	task_definition = "${aws_ecs_task_definition.rda-maxar-definition.arn}"
  	desired_count   = 2

  	load_balancer {
    	target_group_arn  = var.ecs-target-group-arn
    	container_port    = 80
    	container_name    = "simple-app"
	}
}