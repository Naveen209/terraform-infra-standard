# resource "aws_ssm_parameter" "cart_target_group_id" {
#   name  = "/${var.project_name}/${var.Environment}/cart_target_group_id"
#   type  = "String"
#   value = aws_lb_target_group.main.arn
# }

