# module "vpn_sg" {
#   source = "../../terrform-aws-security-group"
#   sg_name = var.sg_name
#   sg_description = var.sg_description
#   vpc_id = data.aws_vpc.default.id
#   common_tags = var.common_tags
#   project_name = var.project_name
#   sg_tags = var.sg_tags
# }

# resource "aws_security_group_rule" "vpn_sg" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = ["${chomp(data.http.my_public_ip.response_body)}/32"]
#   #ipv6_cidr_blocks  = [aws_vpc.example.ipv6_cidr_block]
#   security_group_id = module.vpn_sg.sg_id
# }

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.vpn.id
  key_name = "DevOps_AWS"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnets.public.ids[0]
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg.value]
  tags = merge(
    {
        Name = "Roboshop-vpn"
    },var.common_tags
  )
}