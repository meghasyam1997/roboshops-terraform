resource "aws_instance" "instance" {
  for_each               = var.components
  instance_type          = each.value["instance_type"]
  ami                    = data.aws_ami.ami.id
  vpc_security_group_ids = [data.aws_security_group.allow_all.id]

  tags = {
    Name = "${each.value["name"]}-${var.env}"
  }
}

resource "aws_route53_record" "reccords" {
  for_each = var.components
  name     = "${each.value["name"]}-${var.env}.msdevops72.online"
  type     = "A"
  ttl      = 30
  zone_id  = "Z024184021A09H13X7MEW"
  records  = [aws_instance.instance[each.value["name"]].private_ip]
}