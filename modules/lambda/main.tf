resource "aws_lambda_function" "start_instance_function" {
  filename         = var.start_instance_zip
  function_name    = "start_ec2_function"
  role             = var.role_arn
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(var.start_instance_zip)

  environment {
    variables = {
      INSTANCE_ID = var.instance_id
      REGION      = "ap-south-1"
    }
  }
}

resource "aws_lambda_function" "stop_instance_function" {
  filename         = var.stop_instance_zip
  function_name    = "stop_ec2_function"
  role             = var.role_arn
  handler          = var.handler
  runtime          = var.runtime
  source_code_hash = filebase64sha256(var.stop_instance_zip)

  environment {
    variables = {
      INSTANCE_ID = var.instance_id
      REGION      = "ap-south-1"
    }
  }
}
