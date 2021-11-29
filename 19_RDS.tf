resource "aws_db_instance" "Hong_DB" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "hong6845"
  identifier           = "mydb"   # 식별자 
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.Hong_DB_Subnet_Group.id
  vpc_security_group_ids = [aws_security_group.Hong_sg.id]
  skip_final_snapshot = true
  tags = {
      "Name" = "Hong-RDS"
  }
}
resource "aws_db_subnet_group" "Hong_DB_Subnet_Group" {
    
    name = "hong-dbsb-gp"
    subnet_ids = [aws_subnet.Hong_Prv_db_a.id,aws_subnet.Hong_Prv_db_c.id]
  
}