provider "aws" {
     access_key = "AKIAI3BCKIB6D4ZHVQQQ"
     secret_key = "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"
     region = "us-east-2"
 }
 resource "aws_instance" "testEC2" {
     ami = "ami-0c64dd618a49aeee8"
     instance_type = "t2.micro"
     #key_name = "AWS-HUUPV"
     vpc_security_group_ids = [   
        "sg-40dc2f26" 
       ] 
     associate_public_ip_address = "true" 
     root_block_device {   
        volume_type = "gp2"   
        volume_size = "20" 
     }
 # EBS
     ebs_block_device {
       device_name = "/dev/sdf"
       volume_type = "gp2"
       volume_size = "10"
     }
     tags = {
         Name = "testEC2"
     }
 }
 output "public_ip_of_testEC2" {
   value = "${aws_instance.testEC2.public_ip}"
 }
