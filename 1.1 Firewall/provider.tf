terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "naveen-roboshop-terraform-state"
    key    = "security-groups/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
provider "aws" {
    region = "us-east-1"
}