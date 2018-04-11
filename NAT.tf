# create elastic IP for NAT
resource "aws_eip" "terra_NAT_eip" {
  vpc = true
}

# create nat gateway
resource "aws_nat_gateway" "terra_nat" {
  allocation_id = "${aws_eip.terra_NAT_eip.id}"
  subnet_id     = "${aws_subnet.terra_pub.id}"

  #depends_on    = ["aws_internet_gateway.terra-igw"]
}
