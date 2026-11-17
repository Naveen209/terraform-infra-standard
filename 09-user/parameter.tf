resource "aws_ssm_parameter" "user_target_group_id" {
  name  = "/${var.project_name}/${var.Environment}/user_target_group_id"
  type  = "String"
  value = aws_lb_target_group.main.arn
}

