module "redis_instance" {
    source  = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.ami.id
    key_name = "DevOps_AWS"
    instance_type = "t3.micro"
    subnet_id = local.db_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg.value]
    user_data = file("redis.sh")
    tags = merge(
    {
        Name = "Redis"
    },var.common_tags
  )
  
}

resource "aws_route53_record" "redis" {
  zone_id = var.zone_id
  name    = "redis"
  type    = "A"
  ttl     = 300
  records = [module.redis_instance.private_ip]
}