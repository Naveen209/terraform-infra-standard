resource "aws_lb" "web_lb" {
  name               = "web_lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.web_lb_sg.value]
  subnets            = split(",",data.aws_ssm_parameter.public_subnet_ids.value)

  #enable_deletion_protection = true
  tags = var.common_tags

}

resource "aws_acm_certificate" "example" {
  domain_name       = "roboshopservice.store"
  validation_method = "DNS"
  tags = var.common_tags
}

data "aws_route53_zone" "roboshop" {
  name         = "roboshopservice.store"
  private_zone = false
}

resource "aws_route53_record" "records" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.roboshop.zone_id
}

resource "aws_acm_certificate_validation" "roboshop" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [for record in aws_route53_record.records : record.fqdn]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate.example.arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text"
      message_body = "This is Fixed response from web lb HTTPS"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "web_lb" {
  zone_id = "Z037034227WXO956D2R9Q"
  name    = "roboshopservice.store"
  type    = "A"
  alias {
    name                   = aws_lb.web_lb.dns_name
    zone_id                = aws_lb.web_lb.zone_id 
    evaluate_target_health = true
  }
}