/*Security Group of instance */
resource "aws_security_group" "mysecgroup" {
  name = "Security_group_ubuntu"
  description = "BasicSecurityGroup of instance by terraform"
  tags = {
      Name = "Ubuntu_secgroup"
  }
  vpc_id = "${aws_vpc.myvpc.id}"
  ingress {   /*SSH access */
    protocol = "tcp"
    from_port = "22"
    to_port = "22"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "-1"
    from_port = "0"
    to_port ="0"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

