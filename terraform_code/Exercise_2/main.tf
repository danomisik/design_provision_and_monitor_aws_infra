provider "aws" {
  profile = "default"
  region = var.region
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "greet_lambda" {
  filename      = "greet_lambda.zip"
  function_name = "greet_lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "greet_lambda.lambda_handler"

  runtime = "python3.7"
  source_code_hash = filebase64sha256("greet_lambda.zip")
  environment {
    variables = {
      Name = "greet_lambda"
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
  ]
}

#resource "aws_cloudwatch_log_group" "lambda_log_group" {
#  name              = "/aws/lambda/${aws_lambda_function.greet_lambda.function_name}"
#  retention_in_days = 14
#  depends_on = [
#    aws_lambda_function.greet_lambda,
#  ]
#}


resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}