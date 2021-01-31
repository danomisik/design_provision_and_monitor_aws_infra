# TODO: Designate a cloud provider, region, and credentials
# I don't prefer to write secrets inside source code. For that reason I put credentials inside AWS CLI for 'default' profile through  and now I don't need to specify credentials externally, I just need to specify profile.
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  count = "4"
  ami = "ami-0c6b1d09930fac512"
  instance_type = "t2.micro"
  subnet_id = var.public1_id
  tags = {
    Name = "Udacity T2"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "udacity_m4" {
  count = "2"
  ami = "ami-0c6b1d09930fac512"
  instance_type = "m4.large"
  subnet_id = var.public1_id
  tags = {
    Name = "Udacity M4"
  }
}