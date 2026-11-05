variable "sg_name" {
  default = "roboshop-vpn"
}

variable "sg_description" {
  default = "allow only from selected IP"
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
        component = "vpn"
        Project = "Roboshop"
        Environment= "DEV"
    }
}
variable "sg_tags" {
    default = "vpn_sg"
}