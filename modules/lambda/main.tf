# Single Lambda function (will be either start or stop based on handler)
resource "aws_lambda_function" "function" {
  filename         = var.handler == "start.lambda_handler" ? "${path.module}/start_instance.zip" : "${path.module}/stop_instance.zip"
  function_name    = var.handler == "start.lambda_handler" ? "start_ec2_function" : "stop_ec2_function"
  role             = var.role_arn
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(var.handler == "start.lambda_handler" ? "${path.module}/start_instance.zip" : "${path.module}/stop_instance.zip")

  environment {
    variables = {
      INSTANCE_ID = var.instance_id
      REGION      = "ap-south-1"
    }
  }
}
