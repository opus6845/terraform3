resource "aws_key_pair" "hongkey" {
    key_name = "Hongkey"
    public_key = file("../../.ssh/hongkey1.pub")
}