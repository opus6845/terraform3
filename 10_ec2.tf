data "aws_ami" "amzn" {
    most_recent = true
    
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
      
    }

    owners = ["amazon"]
}

resource "aws_instance" "Hong_web" {
    ami = data.aws_ami.amzn.id
    instance_type = "t2.micro"
    key_name = "Hongkey"
    vpc_security_group_ids = [aws_security_group.Hong_sg.id]
    availability_zone = "ap-northeast-2a"
    private_ip = "10.0.0.11"
    subnet_id = aws_subnet.Hong_Pub_a.id
    user_data = file("./user-data.sh")
    tags = {
        "Name" = "Hong-Web"
    }
}

resource "aws_eip" "Hong-Web-ip" {
    vpc = true
    instance = aws_instance.Hong_web.id
    associate_with_private_ip = "10.0.0.11"
    depends_on = ["aws_internet_gateway.Hong_igw"]
  
}

output "Public_IP" {
    value = aws_instance.Hong_web.public_ip
}