resource "aws_route_table_association" "Hong_ngw_Ass_Prv_A" {
    subnet_id = aws_subnet.Hong_Prv_a.id
    route_table_id = aws_route_table.Hong_ngw_RT.id
  
}
resource "aws_route_table_association" "Hong_ngw_Ass_Prv_C" {
    subnet_id = aws_subnet.Hong_Prv_c.id
    route_table_id = aws_route_table.Hong_ngw_RT.id
  
}
resource "aws_route_table_association" "Hong_ngw_Ass_Prv_DB_A" {
    subnet_id = aws_subnet.Hong_Prv_db_a.id
    route_table_id = aws_route_table.Hong_ngw_RT.id
  
}
resource "aws_route_table_association" "Hong_ngw_Ass_Prv_DB_C" {
    subnet_id = aws_subnet.Hong_Prv_db_c.id
    route_table_id = aws_route_table.Hong_ngw_RT.id
  
}