resource "aws_ssm_parameter" "web_lb_listener_arn" {
  name  = "/${var.project_name}/${var.Environment}/web_lb_listener_arn"
  type  = "String"
  value = aws_lb_listener.front_end.arn # module should have output declaration
}