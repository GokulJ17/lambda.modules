#output "start_ec2_function_arn" {
 # value = aws_lambda_function.start_instance_function.arn
#}

#output "stop_ec2_function_arn" {
 # value = aws_lambda_function.stop_instance_function.arn
#}
output "function_name" {
  value = aws_lambda_function.start_instance_function.function_name
}

output "arn" {
  value = aws_lambda_function.start_instance_function.arn
}

output "stop_function_name" {
  value = aws_lambda_function.stop_instance_function.function_name
}

output "stop_arn" {
  value = aws_lambda_function.stop_instance_function.arn
}

