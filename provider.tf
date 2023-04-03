
##GitHub Variable Keys
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  }


# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = "ami-04581fbf744a7d11f"
  instance_type = "t2.micro"
 # user_data = file("app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}
