resource "aws_instance" "myec2" {
  #ami = lookup(var.ami,var.region)
  ami           = "ami-0800fc0fa715fdcfe"
  instance_type = "t2.micro"
  key_name      = "myprivate"
}

output "ec2_result" {
  value = aws_instance.myec2
}
