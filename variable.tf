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

//ASG

variable "tags" {
  description = "Please provide a tag for resources"
  type        = map(any)
  default     = {
    Team        = "DevOps"
    Environment = "Dev"
  }
}
variable "name_prefix" {
  description = "Provide a value"
  type        = string
  default     = "foobar"
}
variable "image_id" {
  description = "Provide a value"
  type        = string
  default     = "ami-0022f774911c1d690"
}

variable "instance_type" {
  description = "Provide a value"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "Provide a value"
  type        = string
  default     = "1"
}

variable "max_size" {
  description = "Provide a value"
  type        = string
  default     = "3"
}

variable "min_size" {
  description = "Provide a value"
  type        = string
  default     = "1"
}

variable "subnets" {
  type = list 
  default = ["10.0.101.0/24" , "10.0.102.0/24", "10.0.103.0/24"]
  description = "Please provide list of subnets"
}

