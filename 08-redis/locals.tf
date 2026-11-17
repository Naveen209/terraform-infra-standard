locals {
  db_subnet_id = split(
    ",",
    data.aws_ssm_parameter.database_subnet_ids.value
  )[0]
}