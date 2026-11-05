resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app_lb_sg.value]
  subnets            = split(",",data.aws_ssm_parameter.private_subnet_ids.value)


  #enable_deletion_protection = true
  tags = var.common_tags

}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This is Fixed response from app lb"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "app_lb" {
  zone_id = "Z037034227WXO956D2R9Q"
  name    = "*.app.roboshopservice.store"
  type    = "A"
  alias {
    name                   = aws_lb.app_lb.dns_name
    zone_id                = aws_lb.app_lb.zone_id 
    evaluate_target_health = true
  }
}

