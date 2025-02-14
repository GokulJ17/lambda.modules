variable "start_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "start_ec2_function"
}

variable "stop_function_name" {
  description = "Lambda function name"
  type        = string
    default     = "stop_ec2_function"
  }

variable "start_event_name" {
  description = "Name of the start event rule"
  type        = string
}

variable "stop_event_name" {
  description = "Name of the stop event rule"
  type        = string
}

variable "start_schedule" {
  description = "Cron expression for start schedule"
  type        = string
}

variable "stop_schedule" {
  description = "Cron expression for stop schedule"
  type        = string
}

variable "start_lambda_name" {
  description = "Name of the start Lambda function"
  type        = string
}

variable "stop_lambda_name" {
  description = "Name of the stop Lambda function"
  type        = string
}

variable "lambda_arn_start" {
  description = "ARN of the start Lambda function"
  type        = string
}

variable "lambda_arn_stop" {
  description = "ARN of the stop Lambda function"
  type        = string
}

