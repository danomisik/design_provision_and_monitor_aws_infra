# TODO: Define the output variable for the lambda function.
output "lambda_id" {
  value = aws_lambda_function.greet_lambda.id
}