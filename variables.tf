variable "Vpc_cidr_block" {
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}

variable "Public_Subnet_1_cidr_block" {
  description = "public subnet 1 cidr block"
  default     = "10.0.20.0/24"
}

variable "Public_Subnet_2_cidr_block" {
  description = "public subnet 2 cidr block"
  default     = "10.0.21.0/24"
}

variable "Private_Subnet_1_cidr_block" {
  description = "private subnet 1 cidr block"
  default     = "10.0.22.0/24"
}

variable "Private_Subnet_2_cidr" {
  description = "private subnet 2 cidr block"
  default     = "10.0.23.0/24"
}

variable "region" {
  description = "name of region"
  default = "eu-west-1"
}

variable "ami" {
  description = "ami"
  default = "ami-04632f3cef5083854"
}