/* RDS */
resource "aws_db_instance" "rds" {
  availability_zone = "us-east-1b"
  db_subnet_group_name = "${aws_db_subnet_group.rds_subnet.id}"
  engine = "postgres"
  engine_version = "9.6"
  identifier = "rds-test"
  instance_class = "${var.dbinsttype}"
  allocated_storage = 20
  username = "master"
  password = "master123"
  apply_immediately = "false"
  multi_az = "false"

}
/* Launching rds in pvt subnet */
resource "aws_db_subnet_group" "rds_subnet" {
    name = "rds-pvt-subnet"
    subnet_ids = ["${module.vpc.aws_subnet_private_id}","${module.vpc.aws_subnet_private1_id}"]
}

/* RDS Security Group */
resource "aws_security_group" "rd-sg" {
  name = "RDS-sec-group"
  description = "Created RDS from terraform"
  tags ={
    Name = "RDS-security-group"
  }
  vpc_id ="${module.vpc.aws_vpc_myvpc_id}"
  ingress {
   from_port = "5432"
   to_port   = "5432"
   protocol  = "tcp"
   #cidr_blocks = ["${module.vpc.aws_security_group_mysecgroup_id}"]
   security_groups = ["${module.vpc.aws_security_group_mysecgroup_id}"]
  }

  egress {
    protocol = "-1"
    from_port = "0"
    to_port = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
/* Instance Access to RDS via secgroup */
/*
resource "aws_security_group_rule" "instaccess" {  
  type = "ingress"
  from_port = 5432
  to_port = 5432
  protocol = "tcp"
  security_group_id = "${module.vpc.aws_security_group_mysecgroup_id}"
  
}*/

