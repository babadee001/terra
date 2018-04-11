# create network interface
resource "aws_network_interface" "terra_ENI" {
  subnet_id       = "${aws_subnet.terra_pub.id}"
  private_ips     = ["42.1.1.1"]
  security_groups = ["${aws_security_group.terra_pub-sg.id}"]
}

# create elastic IP and attach to eni
resource "aws_eip" "terra_eip" {
  vpc                       = true
  network_interface         = "${aws_network_interface.terra_ENI.id}"
#   associate_with_private_ip = "42.1.1.2"
}

#attach to public instance
resource "aws_network_interface_attachment" "tr_ENI" {
  instance_id          = "${aws_instance.terra_public.id}"
  network_interface_id = "${aws_network_interface.terra_ENI.id}"
  device_index         = 0
}
