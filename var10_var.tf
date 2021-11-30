# 변수 
variable "region" {
    type = string
    default = "ap-northeast-2"
  
}

variable "name" {
    type = string
    default = "Hong"
  
}

# 키페어
variable "key" {
    type = string
    default = "Hongkey"
  
}

# 가용영역
variable "av_zone" {
    type = list
    default = ["a","c"]  
}


# VPC 서브넷
variable "cidr_main" {
    type = string
    default = "10.0.0.0/16"  
}

# IP 0.0.0.0/0
variable "cidr_route" {
    type = string
    default = "0.0.0.0/0"
  
}
# IP v6
variable "cidr_routev6" {
    type = string
    default = "::/0"
  
}

# 서브넷 변수
variable "pub_sub" {
  type = list
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

variable "prv_sub" {
  type = list
  default = ["10.0.2.0/24","10.0.3.0/24"]
}

variable "prv_db_sub" {
    type = list
    default = ["10.0.4.0/24","10.0.5.0/24"]
  
}

variable "ami_name" {
    type = string
    default = "amzn2-ami-hvm-*-x86_64-gp2"
  
}

variable "virtual_type" {
    type = string
    default = "hvm"
  
}

variable "ami_owners" {
    type = string
    default = "amazon"
  
}

variable "ami_option" {
    type = string
    default = "virtualization-type"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

# LB
variable "lb_type" {
    type = string
    default = "application"
  
}
variable "lb_listenr_tg_type" {
    type = string
    default = "forward"
  
}
variable "health_check_path" {
    type = string
    default = "/health.html"
  
}

variable "health_check_port" {
    type = string
    default = "traffic-port"
  
}

variable "instance_profile" {
    type = string
    default = "admin_role"
  
}

variable "pg_strategy" {
    type = string
    default = "cluster"
  
}

# database 

variable "db_st_type" {
    type = string
    default = "gp2"
  
}
variable "db_engine_type" {
    type = string
    default = "mysql"
  
}
variable "db_engine_version" {
    type = string
    default = "8.0"
  
}
variable "db_instance_class" {
    type = string
    default = "db.t2.micro"
  
}
variable "db_name" {
    type = string
    default = "mydb"
  
}
variable "db_user" {
    type = string
    default = "admin"
  
}
variable "db_passwd" {
    type = string
    default = "hong6845"
  
}
variable "db_group_name" {
    type = string
    default = "default.mysql8.0"
  
}

variable "db_avz" {
    type = string
    default = "ap-northeast-2a"
  
}