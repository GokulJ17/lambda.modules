variable "start_event_name" {
  description = "Name of the EventBridge rule to start EC2"
  type        = string
  default     = "start_ec2_event"
}

variable "stop_event_name" {
  description = "Name of the EventBridge rule to stop EC2"
  type        = string
  default     = "stop_ec2_event"
}

variable "start_schedule" {
  description = "Cron expression to start EC2 at 8:30 AM UTC"
  type        = string
  default     = "cron(55 10 * * ? *)"
}

variable "stop_schedule" {
  description = "Cron expression to stop EC2 at 11:00 PM UTC"
  type        = string
  default     =  "cron(00 11 * * ? *)"
}

variable "start_lambda_name" {
  description = "Lambda function name to start EC2"
  type        = string
  default     = "start_ec2_function"
}

variable "stop_lambda_name" {
  description = "Lambda f unction name to stop EC2"
  type        = string
  default     = "stop_ec2_function"
}
