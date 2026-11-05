resource "aws_lb" "web_lb" {
  name               = "web_lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.web_lb_sg.value]
  subnets            = split(",",data.aws_ssm_parameter.public_subnet_ids.value)

  #enable_deletion_protection = true
  tags = var.common_tags

}

resource "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_ssm_parameter.app_lb_id.value
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text"
      message_body = "This is Fixed response from app lb"
      status_code  = "200"
    }
  }
}