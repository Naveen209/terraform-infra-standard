module "vpc" {
  source = "git::https://github.com/Naveen209/terraform-advanced-vpc.git"
  cidr_block = var.cidr_block
  common_tags = var.common_tags
  project_name = var.project_name
  Environment = var.Environment
  public_cidr_blocks = var.public_cidr_blocks
  private_cidr_blocks = var.private_cidr_blocks
  database_cidr_blocks = var.database_cidr_blocks


  #Peering
  peering_required = true
  requestor_vpc_id = data.aws_vpc.default_vpc.id
  default_route_table_id = data.aws_vpc.default_vpc.main_route_table_id
  default_cidr_block = data.aws_vpc.default_vpc.cidr_block

}