output "aws_security_group_mysecgroup_id" {
  value = "${aws_security_group.mysecgroup.id}"
}
output "aws_vpc_myvpc_id" {
  value = "${aws_vpc.myvpc.id}"
}

output "aws_subnet_public_id" {
  value = "${aws_subnet.public.id}"
}
output "aws_subnet_private_id" {
  value = "${aws_subnet.private.id}"
}
output "aws_subnet_private1_id" {
  value = "${aws_subnet.private1.id}"
}
