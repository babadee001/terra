# Create the public Security Group
resource "aws_security_group" "terra_pub-sg" {
  vpc_id      = "${aws_vpc.terra_VPC.id}"
  name        = "terra pub-sg"
  description = "My terra public Security Group"

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  tags = {
    Name = "My terra public Security Group"
  }
}

# end resource

# Create the private Security Group
resource "aws_security_group" "terra_priv-sg" {
  vpc_id      = "${aws_vpc.terra_VPC.id}"
  name        = "terra priv-sg"
  description = "My terra private Security Group"

  ingress {
    cidr_blocks = "${var.ingressCIDRblock}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  tags = {
    Name = "My terra private Security Group"
  }
}

# end resource

