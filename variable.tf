variable "region" {
    description = "AWS region"
    default = "us-east-2"
}
variable "vpc_name" {
    default = "task-vpc"
}
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "private_subnet1" {
     default = "10.0.1.0/24"
}
variable "private_subnet2" {
     default = "10.0.2.0/24"
}
variable "private_subnet3" {
     default = "10.0.3.0/24"
}

variable "public_subnet1" {
    default = "10.0.101.0/24"
}
variable "public_subnet2" {
    default = "10.0.102.0/24"
}
variable "public_subnet3" {
    default = "10.0.103.0/24"
}





data "aws_availability_zones" "available" {
  state = "available"
}