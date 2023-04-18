# Terraform Block
terraform {
  required_version = ">= 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  } 
} 

##GitHub Variable Keys
provider "aws" {
  region     = var.region
  }


# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = "ami-04581fbf744a7d11f"
  instance_type = "t2.micro"
  user_data = file("app1-install.sh")
  tags = {
    "Name" = "Jenkins - Terraform Demo"
  }
}
