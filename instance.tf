resource "aws_instance" "myec2" {
  ami = "${var.image}"
  instance_type = "${var.insttype}"
  availability_zone = "${var.az}"
  vpc_security_group_ids = ["${module.vpc.aws_security_group_mysecgroup_id}"]
  subnet_id = "${module.vpc.aws_subnet_public_id}"
  key_name = "tfkey" /* Pem Key */
  tags = {
      Name = "test-instance"
      Database = "RDS"
      Description = "Connecting RDS with instance"
      Tool = "Terraform"
    }
  volume_tags = {
    Name = "myvol_myec2"
  }
  root_block_device {
   volume_size = 8
  }
}