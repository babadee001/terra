# Create the public Route Table
resource "aws_route_table" "terra_public_route_table" {
  vpc_id = "${aws_vpc.terra_VPC.id}"

  tags {
    Name = "tr public route table"
  }
}

# end resource

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "terra_public_association" {
  subnet_id      = "${aws_subnet.terra_pub.id}"
  route_table_id = "${aws_route_table.terra_public_route_table.id}"
} # end resource

# Create the private Route Table
resource "aws_route_table" "terra_private_route_table" {
  vpc_id = "${aws_vpc.terra_VPC.id}"

  tags {
    Name = "tr private route table"
  }
}

# Associate the Route Table with the private Subnet 
resource "aws_route_table_association" "terra_private_association" {
  subnet_id      = "${aws_subnet.terra_priv.id}"
  route_table_id = "${aws_route_table.terra_private_route_table.id}"
}

# end resource

# add the internet gateway to the public route table
resource "aws_route" "route" {
  route_table_id         = "${aws_route_table.terra_public_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.terra-igw.id}"
}

# add the NAT gateway to the private route table
resource "aws_route" "nat_route" {
  route_table_id         = "${aws_route_table.terra_private_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_nat_gateway.terra_nat.id}"
}
