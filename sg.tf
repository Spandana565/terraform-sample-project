resource "aws_security_group" "web_traffic" {
  name        = "${var.sgname}"
  description = "inbound ports for ssh and standard http and everything outbound"
  vpc_id = "${var.vpc_id}"
  
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["${var.my_access_cidr}"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" = "true"
  }
}