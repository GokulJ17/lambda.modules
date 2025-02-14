output "start_lambda_arn" {
  value = module.lambda_start.arn
}

output "stop_lambda_arn" {
  value = module.lambda_stop.stop_arn
}

output "start_lambda_name" {
  value = module.lambda_start.function_name
}

output "stop_lambda_name" {
  value = module.lambda_stop.stop_function_name
}
