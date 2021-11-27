resource "aws_key_pair" "hongkey" {
    key_name = "Hongkey"
    public_key = file("../../.ssh/hongkey1.pub")
    #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrQe/0MUsJBsEZ1T2t4hdmvsZNoYoDZqOEcLthF3IvqQ7chJq1T0rADMKVBpPaRrrMCq/T+c60WIxyPcZSfXRnR0AbMQ0uX5iDjOM6CNBs6D45g3xVjKOke5g+MtHAX/dPBvlVA94dWezC24jPU1ujpkcaquN4pW1RNmgiYp+j1s3AblbznpHGkcBd1ahtEaix0w2D0unN2dEbYx8mmYsec4mpaKL33I+a/0e15566ucn7hnxCb5mfG9+MSGLj5bRANmw7pBglK7QxYAPoyOoze81UdMIca+WT7u+V5jm6akOI8k+n7xxFa9jQIyNSxPyj/I0Z9Yn8hejX5uqCbHruHFvv92B/uv1O3LuCo+ooNLTc5jbYuipNYiORT8jKM4mQHpZgl8Lrhk8SM/FRuLYU3xnsNSqdKb5KxAobuqgxKIgRzSeRdaxkBnX+dXAZPUfwMyyZgOMfXMQaG+m62zf3hhzjOyvGcG+EnodktMu/nUyoTl2WkR+461g4mNzTozs="

  
}