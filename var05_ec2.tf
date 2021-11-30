# ec2 AMI
data "aws_ami" "amzn" {
    most_recent = true
    
    filter {
        name = "name"
        values = [var.ami_name]
    }
    filter {
        name = var.ami_option
        values = [var.virtual_type]
      
    }

    owners = [var.ami_owners]
}

# 인스턴스 생성
resource "aws_instance" "Hong_web" {
    ami = data.aws_ami.amzn.id
    instance_type = var.instance_type
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.Hong_sg.id]
    availability_zone = "${var.region}${var.av_zone[0]}"
    private_ip = "10.0.0.11"
    subnet_id = aws_subnet.Hong_Pub[0].id
    user_data = file("./user-data.sh")
    tags = {
        "Name" = "${var.name}-Web"
    }
}


resource "aws_eip" "Hong-Web-ip" {
    vpc = true
    instance = aws_instance.Hong_web.id
    associate_with_private_ip = "10.0.0.11"
    depends_on = [aws_internet_gateway.Hong_igw]
  
}

output "Public_IP" {
    value = aws_instance.Hong_web.public_ip
}