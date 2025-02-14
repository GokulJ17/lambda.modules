#variable "start_function_name" {
  #description = "Lambda function name"
  #type        = string
 # default     = "StartEC2Instance"
#} 

#variable "stop_function_name" {
 # description = "Lambda function name"
  #type        = string
  #default     = "StopEC2Instance"
#}

#variable "handler" {
  #description = "Lambda function handler"
  #type        = string
#  default     = "lambda_function.lambda_handler"
#}

#variable "stop_handler" {
  #description = "Lambda function handler"
  #type        = string
  #default     = "lambda_function.lambda_handler"
#}


#variable "runtime" {
  #description = "Lambda function runtime"
  #  type        = string
 #default     = "python3.9"
#}

variable "instance_id" {
  description = "EC2 Instance ID"
  default = "i-0a25de1cdbedb0ba0"
  type        = string
}

#variable "region" {
 # description = "AWS region"
  # default     = "ap-south-1"
#}

variable "start_instance_zip" {
 type        = string
 default     = "modules/lambda/start_instance.zip"  
}

variable "stop_instance_zip" {
 type        = string
 default     = "modules/lambda/stop_instance.zip"  
}

variable "fun" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
}

variable "filename" {
  description = "Lambda function filename"
  type        = string
}

variable "role_arn" {
  type = string
  description = "ARN of the IAM role for Lambda"
}

#variable "lambda_arn" {
  #description = "arn of the lambda"
 # type = string
#}
