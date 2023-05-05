
data "aws_ami" "app_ami"{
    most_recent = true
    owners = [ "amazon" ]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm*" ]
  }

}

resource "aws_instance" "firstec2" {
  ami                     = data.aws_ami.app_ami
  instance_type           = "t2.micro"
}
