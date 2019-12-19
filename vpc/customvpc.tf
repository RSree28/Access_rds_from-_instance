/* VPC */
resource "aws_vpc" "myvpc"{
   cidr_block = "20.0.0.0/16"
   tags ={
       Name = "MyVpc"
    }
}
/* Creating Internet Gateway */
resource "aws_internet_gateway" "myigw" {
    vpc_id = "${aws_vpc.myvpc.id}"
  
}
/*Public Subnet */
resource "aws_subnet" "public" {
    vpc_id = "${aws_vpc.myvpc.id}"
    availability_zone = "us-east-1a"
    cidr_block = "20.0.2.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "Public Subnet"
        Vpc_name = "MyVpc"
    
    }
  
}
/* Private Subnet */
resource "aws_subnet" "private" {
    vpc_id = "${aws_vpc.myvpc.id}"
    availability_zone ="us-east-1b"
    cidr_block = "20.0.4.0/24"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "Private Subnet"
        Vpc_name = "MyVpc"
    }
}
/* Pvt subnet-1 */
resource "aws_subnet" "private1" {
    vpc_id = "${aws_vpc.myvpc.id}"
    availability_zone ="us-east-1d"
    cidr_block = "20.0.6.0/24"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "Private Subnet-1"
        Vpc_name = "MyVpc"
    }
}

/* Public Route Table  */
resource "aws_route_table" "myrt" {
 vpc_id = "${aws_vpc.myvpc.id}"
 route{
   cidr_block ="0.0.0.0/0"
   gateway_id ="${aws_internet_gateway.myigw.id}"
 }
  tags = {
      Name = "public-route"
  }
}
/* Private Route Table */
resource "aws_default_route_table" "pvt-rt" {
  default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"
  tags = {
      Name = "private-route"
  }
}

/* Route table association with public subnets*/
resource "aws_route_table_association" "pub" {
  subnet_id ="${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.myrt.id}"
}

