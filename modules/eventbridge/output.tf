output "start_lambda_arn" {
  value = "aws_lambda_function.start_instance_function.arn"
}

output "stop_lambda_arn" {
  value = "aws_lambda_function.stop_instance_function.arn"
}

output "start_lambda_name" {
  value = "start_instance"
}

output "stop_lambda_name" {
  value = "stop_instance"
}