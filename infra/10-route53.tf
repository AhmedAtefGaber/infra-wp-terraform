data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone
}

resource "aws_route53_record" "bastion" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "bastion.${var.hosted_zone}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_instance.bastion-iac.public_dns]
}