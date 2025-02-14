variable "instance_id" {
  description = "EC2 Instance ID"
  default     = "i-0a25de1cdbedb0ba0"
  type        = string
}

variable "start_instance_zip" {
  type        = string
  default     = "modules/lambda/start_instance.zip"  
}

variable "stop_instance_zip" {
  type        = string
  default     = "modules/lambda/stop_instance.zip"  
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
  type        = string
  description = "ARN of the IAM role for Lambda"
}
