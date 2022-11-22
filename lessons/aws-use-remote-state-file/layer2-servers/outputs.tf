# output "network_details" {
#   value = data.terraform_remote_state.network
# }

output "webserver_sg_id" {
  value = aws_security_group.webserver_sg.id
}

output "webserver_public_id" {
  value = aws_instance.web_server.public_ip
}
