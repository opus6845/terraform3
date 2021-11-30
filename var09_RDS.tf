resource "aws_db_instance" "Hong_DB" {
  allocated_storage    = 20
  storage_type         = var.db_st_type
  engine               = var.db_engine_type
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_passwd
  identifier           = var.db_name   # 식별자 
  parameter_group_name = var.db_group_name
  availability_zone = var.db_avz
  db_subnet_group_name = aws_db_subnet_group.Hong_DB_Subnet_Group.id
  vpc_security_group_ids = [aws_security_group.Hong_sg.id]
  skip_final_snapshot = true
  tags = {
      "Name" = "${var.name}-RDS"
  }
}
resource "aws_db_subnet_group" "Hong_DB_Subnet_Group" {
    
    name = "hong-dbsb-gp"
    subnet_ids = [aws_subnet.Hong_Prv_db[0].id,aws_subnet.Hong_Prv_db[1].id]
  
}