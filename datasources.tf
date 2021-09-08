data "aws_availability_zones" "azs" {
}

#will get the local ip
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

