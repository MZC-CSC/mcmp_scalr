version "v1"

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name         = "example-vpc"
    mandatory-tag = var.mandatory_tag
  }
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Example Security Group"
  vpc_id      = aws_vpc.example.id
}

resource "aws_instance" "example_with_tag" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name          = "example-instance"
    mandatory-tag = var.mandatory_tag
  }

  vpc_security_group_ids = [aws_security_group.example.id]
  key_name               = aws_key_pair.example.key_name
}

resource "aws_instance" "example_without_tag" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }

  vpc_security_group_ids = [aws_security_group.example.id]
  key_name               = aws_key_pair.example.key_name
}

resource "aws_key_pair" "example" {
  key_name   = "example-key"
  public_key = file(var.public_key_path)
}

variable "aws_region" {
  default = "us-west-2"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_key_path" {
  default = "path/to/your/public_key.pub"
}

variable "mandatory_tag" {
  default = "example-value"
}
