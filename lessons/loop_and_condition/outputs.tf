output "created_all_iam_users" {
  value = aws_iam_user.users
}

output "created_iam_user_ids" {
  value = aws_iam_user.users[*].id
}

# return double list
output "created_iam_users_custom" {
  value = [
    for user in aws_iam_user.users :
    "Username: ${user.name} has ARN: ${user.arn}"
  ]
}

# return Map
output "created_iam_users_map" {
  value = {
    for user in aws_iam_user.users :
    user.unique_id => user.id
  }
}

# return List with IF condition
output "custom_if_length" {
  value = [
    for user in aws_iam_user.users :
    user.name
    if length(user.name) == 4
  ]
}

# print MAP of server's id and public ip
output "server_ids_and_public_ips" {
  value = {
    for server in aws_instance.servers :
    server.id => server.public_ip
  }
}
