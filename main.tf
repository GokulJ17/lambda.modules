provider "aws" {
  region = "ap-south-1"
}

# IAM Role for Lambda Functions
module "iam" {
  source     = "./modules/iam"
  role_name  = "lambda_ec2_role"
}

# Lambda Function to Start EC2
module "lambda_start" {
  source            = "./modules/lambda"
  fun              = "start_ec2_function"
  handler          = "start.lambda_handler"
  runtime          = "python3.9"
  filename         = "${path.module}/modules/lambda/start.py"
  role_arn         = module.iam.arn
  start_instance_zip = "${path.module}/modules/lambda/start_instance.zip"
  stop_instance_zip  = "${path.module}/modules/lambda/stop_instance.zip"
}

# Lambda Function to Stop EC2
module "lambda_stop" {
  source            = "./modules/lambda"
  fun              = "stop_ec2_function"
  handler          = "stop.lambda_handler"
  runtime          = "python3.9"
  filename         = "${path.module}/modules/lambda/stop.py"
  role_arn         = module.iam.arn
  start_instance_zip = "${path.module}/modules/lambda/start_instance.zip"
  stop_instance_zip  = "${path.module}/modules/lambda/stop_instance.zip"
}

# EventBridge Module
module "eventbridge" {
  source            = "./modules/eventbridge"
  lambda_arn_start  = module.lambda_start.arn            # Use the correct output
  lambda_arn_stop   = module.lambda_stop.stop_arn        # Use the correct output
  start_lambda_name = "start_ec2_function"               # Use the actual function name
  stop_lambda_name  = "stop_ec2_function"                # Use the actual function name
  start_event_name  = "start_ec2_event"
  stop_event_name   = "stop_ec2_event"
  start_schedule    = "cron(40 06 * * ? *)"             # 5:40 AM UTC
  stop_schedule     = "cron(45 06 * * ? *)"             # 5:45 AM UTC
}
