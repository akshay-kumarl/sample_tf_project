provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "webserverexample" {
  ami           = "ami-08718895af4dfa033"  # Use the latest Ubuntu AMI ID
  instance_type = "t2.micro"              # Instance type
  tags = {
    Name = "Mumbai-EC2-Instance"  # Tag the instance
    env = "dev"
}
  vpc_security_group_ids = ["sg-05cd9bab43a70250e"]
  key_name = "keypairbylearnjan"  
}
