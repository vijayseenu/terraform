data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  #ami = lookup(var.ami,var.region)
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  key_name      = "myprivate"
}

output "ec2_output" {
  value = aws_instance.myec2
}
