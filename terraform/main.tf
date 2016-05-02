variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_ssh_key_name" {
  default = "goapp"
}

variable "aws_ami_id" {
  default = "ami-a5368cd6"
}

variable "aws_ssh_pub_key" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"
}

# AWS key
resource "aws_key_pair" "goapp_pub_key" {
  key_name   = "${var.aws_ssh_key_name}"
  public_key = "${var.aws_ssh_pub_key}"
}

# EC2 app instances
resource "aws_instance" "ec2_app_instance" {
  ami           = "${var.aws_ami_id}"
  instance_type = "t1.micro"
  key_name      = "${var.aws_ssh_key_name}"
  count         = "2"

  tags {
    Name     = "${format("ec2-goapp-%02d", count.index+1)}"
    Function = "goapp"
  }
}

resource "aws_instance" "ec2_web_instance" {
  ami           = "${var.aws_ami_id}"
  instance_type = "t1.micro"
  key_name      = "${var.aws_ssh_key_name}"

  tags {
    Name     = "${format("ec2-goweb-%02d", count.index+1)}"
    Function = "web"
  }
}
