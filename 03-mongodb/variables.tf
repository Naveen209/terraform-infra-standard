variable "sg_name" {
  default = "mongodb-vpn"
}

variable "sg_description" {
  default = "allow only from instances with source security group"
}

variable "project_name" {
    default = "Roboshop"
}
variable "Environment" {
    default = "DEV"
}
variable "common_tags"{ 
    default = {
        terraform = true
        component = "mongodb"
    }
}
variable "sg_tags" {
    default = "mongodb_sg"
}

variable "zone_id" {
  default = "Z037034227WXO956D2R9Q"
}
