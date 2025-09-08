# data "aws_region" "current" {

# }

resource "aws_vpc" "ashdocktfvpc" {
    provider = aws.us
    cidr_block = "22.0.0.0/16"

    tags = {
        Name = "ashdocktfvpc"
        Owner = var.owner
        Purpose = var.purpose[2]
            }
}
resource "aws_security_group"  "allow_ssh" {
    name = "ssh_access"
    provider = aws.us
    description = "Allow ssh access"
    depends_on = [
    aws_vpc.ashdocktfvpc
  ]
    vpc_id = aws_vpc.ashdocktfvpc.id
    tags = {
        Name = "allow_ssh"
    }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    
}
}

resource "aws_vpc_security_group_ingress_rule" "allow_rule" {
  security_group_id = aws_security_group.allow_ssh.id
  provider = aws.us
  

  depends_on = [
    aws_security_group.allow_ssh
  ]
  cidr_ipv4         = "45.112.41.148/32"  #aws_vpc.ashdocktfvpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
# resource "aws_vpc_security_group_egress_rule" "allow_all_og" {
#     security_group_id = aws_security_group.allow_ssh.id
#     cidr_ipv4 = "0.0.0.0/0"
#     ip_protocol = "-1"
    


# }

resource "aws_subnet" "az1" {
  vpc_id = aws_vpc.ashdocktfvpc.id
  provider = aws.us
  cidr_block = cidrsubnet(var.cidrsub, 8, 1)
    tags = {
    Name = "az1"
  }
  
}

resource "aws_subnet" "az2" {
  vpc_id = aws_vpc.ashdocktfvpc.id
  provider = aws.us
  cidr_block = cidrsubnet(var.cidrsub, 8, 2)
  tags = {
    Name = "az2"
  }
  
}
resource "aws_subnet" "az3" {
  vpc_id = aws_vpc.ashdocktfvpc.id
  
  provider = aws.us
  cidr_block = cidrsubnet(var.cidrsub, 8, 3)
    tags = {
    Name = "az3"
  }
  
}

resource "aws_subnet" "az4" {
  vpc_id = aws_vpc.ashdocktfvpc.id
  provider = aws.us
  cidr_block = cidrsubnet(var.cidrsub, 8, 4)
    tags = {
    Name = "az4"
  }
  
}
resource "aws_instance" "server1" {
    ami = var.ami
    instance_type = var.insttype
    # region = aws.us_region
    provider = aws.us
}

#ami-04ba2acd1134ec7d0
# data "tls_private_key" "key1" {
  
# }

#aws ec2 create-store-image-task --image-id ami-0178d54841f5b8995 --bucket s3://ash11sept24/