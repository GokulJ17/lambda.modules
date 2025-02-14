provider "aws" {
  region = "ap-south-1"
}

# IAM Role for Lambda Functions
module "iam" {
  source     = "./modules/iam"
  role_name  = "lambda_ec2_role"
}

# CloudWatch Log Groups
module "cloudwatch" {
  source = "./modules/cloudwatch"
}

# Lambda Function to Start EC2
module "lambda_start" {
  source            = "./modules/lambda"
  handler          = "start.lambda_handler"
  runtime          = "python3.9"
  filename         = "${path.module}/modules/lambda/start.py"
  role_arn         = module.iam.arn
  start_instance_zip = "${path.module}/modules/lambda/start_instance.zip"
  stop_instance_zip  = "${path.module}/modules/lambda/stop_instance.zip"
  depends_on       = [module.cloudwatch]
}

# Lambda Function to Stop EC2
module "lambda_stop" {
  source            = "./modules/lambda"
  handler          = "stop.lambda_handler"
  runtime          = "python3.9"
  filename         = "${path.module}/modules/lambda/stop.py"
  role_arn         = module.iam.arn
  start_instance_zip = "${path.module}/modules/lambda/start_instance.zip"
  stop_instance_zip  = "${path.module}/modules/lambda/stop_instance.zip"
  depends_on       = [module.cloudwatch]
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
  start_schedule    = "cron(00 11 * * ? *)"             # 5:40 AM UTC
  stop_schedule     = "cron(05 11 * * ? *)"             # 5:45 AM UTC
}
