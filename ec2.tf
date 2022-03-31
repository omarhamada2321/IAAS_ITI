provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vm" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name= "omarkey"
  vpc_security_group_ids = [aws_security_group.SG_OMAR.id]
  tags = {
    Name = "3mora"
  }
}

resource "aws_security_group" "SG_OMAR" {
  name        = "SG_OMAR"
  description = "Allow ssh only"
 

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}






resource "aws_key_pair" "deployer" {
  key_name   = "omarkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCMDYPQyJaiCYeespJ1UtrLsdnEqlRFwQO2XUJAwlwF8ESoMMMEX8kkAgNnIusiTnLJaoQ8jYI4mAgenF45qqSDgBfy2rtqeEaKuXiYCU6E6A8s3TWKWtGZ587Ie8FTVhxAMghHl2RnkGUSIbuButrhRZrjcyMNdnO1RGf0w/ZBMnqPdShuIgyic+NTC3Uk2ypwZh+sNBeI369hXU/Gk3ffqhjKR2NDOI/Q7gKvt6f88H4CAH/fsyT24Trhk+MZdkbhIDJIT1PQbXegsJJz8BPBBTij+Vyh3g4CSh8F/zL9sAuLTFCAiD4qb44r9SBG9Gj8mqBOkkmrvZv7Zr4cAFFl"

}





