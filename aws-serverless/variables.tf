variable "name" {
  description = "Name of Resources"
  default     = "Serverless-APIGateway-Lambda"
}

variable "tags" {
  description = "Tags to apply to Resources"
  default = {
    Owner   = "Nick Samartsev"
    Company = "Samartsev LTD"
  }
}

variable "api_gateway_my_domain" {
  description = "Domain name of API Gateway to use"
  default     = "samartsev.net"
}

variable "api_gateway_my_domain_certificate_arn" {
  description = "Certificate ARN which cover [api_gateway_my_domain]"
  default     = "arn:aws:acm:eu-central-1:594366502095:certificate/f1b2ec46-f933-462a-a372-eef2ac6cbbed"
}