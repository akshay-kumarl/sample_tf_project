provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAZQ22JFVNNW573YQH"
  secret_key = "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"
}

resource "aws_instance" "webserverexample" {
  ami = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"   
}
