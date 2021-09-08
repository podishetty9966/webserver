resource "aws_key_pair" "web" {
  key_name   = "dataops-dev"
  public_key = "${file("scripts/web.pub")}"
}

