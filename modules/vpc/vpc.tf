resource "aws_vpc" "rda_maxar_vpc" {
 
  cidr_block = var.cidr_block_vpc

 tags = {
    Name = "rda_maxar_vpc"
  }

}

output "id" {
  value = "${aws_vpc.rda_maxar_vpc.id}"
}