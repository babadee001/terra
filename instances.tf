data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "terra_public" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "terra_public"
  }

  security_groups = ["${aws_security_group.terra_pub-sg.id}"]

  subnet_id = "${aws_subnet.terra_pub.id}"

  #   network_interface {
  #     network_interface_id = "${aws_network_interface.terra_ENI.id}"
  #     device_index         = 0
  #   }
}

#create private instance
resource "aws_instance" "terra_private" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags {
    Name = "terra_private"
  }

  security_groups = ["${aws_security_group.terra_priv-sg.id}"]

  subnet_id = "${aws_subnet.terra_priv.id}"
}
