module "webserver_instance" {
  # count = ?
  source           = "github.com/nsamartsev/aws-webserver-module/modules/aws/aws_instance"
  instance_profile = aws_iam_instance_profile.web_console_session_profile.id
  security_group   = aws_security_group.webserver_sg.id
}
