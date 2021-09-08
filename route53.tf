data "aws_route53_zone" "k8stech" {
  name = "k8stech.uk" #update the domain name here
  private_zone = false
}

#CREATE A RECORD SET
resource "aws_route53_record" "k8stech" {
  zone_id = "${data.aws_route53_zone.k8stech.zone_id}"
  name    = "${data.aws_route53_zone.k8stech.name}"
  type    = "A"
  alias {
    name = "${aws_elb.dataops-dev-elb.dns_name}"
    zone_id = "${aws_elb.dataops-dev-elb.zone_id}"
    evaluate_target_health = false
  }
}

