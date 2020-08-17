
resource "aws_route_table" "rda_maxar_route_table" {
  vpc_id = "${aws_vpc.rda_maxar_vpc.id}"
  route {
    cidr_block = var.cidr_block_route_table
    gateway_id = "${aws_internet_gateway.rda_maxar_ig.id}"
  }
 tags = {
    Name = "rda_maxar_route_table"
  }
}

resource "aws_route_table" "maxar_rda_route_table_private" {
    vpc_id = "${aws_vpc.rda_maxar_vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.rda_maxar_nat_gw.id}"
    }

    tags = {
        Name = "maxar_rda_route_table_private"
    }
}

resource "aws_route_table_association" "rda_maxar_rt_association" {
  subnet_id = "${aws_subnet.rda_maxar_subnet_public_1.id}"
  route_table_id = "${aws_route_table.rda_maxar_route_table.id}"
}

resource "aws_route_table_association" "rda_maxar_rt_association2" {
  subnet_id = "${aws_subnet.rda_maxar_subnet_public_2.id}"
  route_table_id = "${aws_route_table.rda_maxar_route_table.id}"
}


resource "aws_route_table_association" "rda_maxar_rt_association3" {
    subnet_id = "${aws_subnet.rda_maxar_subnet_private_1.id}"
    route_table_id = "${aws_route_table.maxar_rda_route_table_private.id}"
}
resource "aws_route_table_association" "rda_maxar_rt_association4" {
    subnet_id = "${aws_subnet.rda_maxar_subnet_private_2.id}"
    route_table_id = "${aws_route_table.maxar_rda_route_table_private.id}"
}