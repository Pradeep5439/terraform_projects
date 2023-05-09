provider "aws" {
  region     = var.provider_aws.region
  access_key = var.provider_aws.access_key
  secret_key = var.provider_aws.secret_key
}


data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "firstec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}

resource "aws_vpc" "default"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Default VPC"
    }
}
