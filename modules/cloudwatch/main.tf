resource "aws_cloudwatch_log_group" "start_lambda_log_group" {
  name              = "/aws/lambda/start_ec2_function"
  retention_in_days = 14
}

resource "aws_cloudwatch_log_group" "stop_lambda_log_group" {
  name              = "/aws/lambda/stop_ec2_function"
  retention_in_days = 14
} 