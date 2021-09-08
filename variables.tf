variable "region" {
  description = "choose region for ur stack"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "choose cidr for vpc"
  type        = string
  default = "10.20.0.0/16"
}

variable "my_app_s3_bucket" {
  default = "dataops-app-dev"
}

variable "web_ec2_count" {
  description = "choose no of ec2 instances web"
  type        = string
  default     = "1"  #Depending on need at runtime can change
}

variable "web_amis" {
    type = map
    default = {
       us-east-1 = "ami-087c17d1fe0178315"
    }
}

variable "web_instance_type" {
  description = "choose instance for ur web"
  type        = string
  default     = "t2.micro"
}

variable "web_tags" {
    type = map
    default = {
       Name = "Webserver"
  }
}

