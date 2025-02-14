resource "aws_cloudwatch_event_rule" "start_event" {
  name                = var.start_event_name
  description         = "Schedule for starting EC2 instance"
  schedule_expression = var.start_schedule
}

resource "aws_cloudwatch_event_target" "start_target" {
  rule      = aws_cloudwatch_event_rule.start_event.name
  target_id = "StartEC2Instance"
  arn       = var.lambda_arn_start
}

resource "aws_cloudwatch_event_rule" "stop_event" {
  name                = var.stop_event_name
  description         = "Schedule for stopping EC2 instance"
  schedule_expression = var.stop_schedule
}

resource "aws_cloudwatch_event_target" "stop_target" {
  rule      = aws_cloudwatch_event_rule.stop_event.name
  target_id = "StopEC2Instance"
  arn       = var.lambda_arn_stop
}

resource "aws_lambda_permission" "allow_start_event" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.start_lambda_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start_event.arn
}

resource "aws_lambda_permission" "allow_stop_event" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.stop_lambda_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop_event.arn
}

  