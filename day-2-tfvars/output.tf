output "public_ip" {
  value     = aws_instance.dev.public_ip
  sensitive = false
}

output "private_ip" {
  value     = aws_instance.dev.private_ip
  sensitive = true
}