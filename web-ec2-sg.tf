resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow traffic for web apps on ec2"
  vpc_id      = "${aws_vpc.main.id}"
    ingress {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"] # will get IP from datasource.tf (or)
      #cidr_blocks      = ["1.2.3.4/32", "1.2.3.4/32"] # Add number ip address for user access
    }

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  tags = {
    Name = "nat_sg"
  }
}
