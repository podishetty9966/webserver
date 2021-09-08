locals {
  vpc_name ="${terraform.workspace == "dev" ? "dataops-dev-vpc" : "dataops-prod-vpc"}"
}

# locals{
#   az_names = "${data.aws_availability_zones.azs.names}"
# }

