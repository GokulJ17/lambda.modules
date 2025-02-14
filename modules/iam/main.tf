resource "aws_iam_role" "lambda_ec2_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
# this is my policy
resource "aws_iam_policy" "lambda_ec2_policy" {
  name        = "lambda_ec2_policy"
  description = "Allows Lambda to Start/Stop EC2 instances"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstances"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_ec2_attachment" {
  role       = aws_iam_role.lambda_ec2_role.name
  policy_arn = aws_iam_policy.lambda_ec2_policy.arn
}


