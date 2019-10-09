output "ecs-service-role-arn" {
  value = "${aws_iam_role.ecs-service-role.arn}"
}