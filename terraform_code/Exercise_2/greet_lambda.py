def lambda_handler(event, context):
    print("Lambda called with request ID:", context.aws_request_id)
    return "Greeting from Lambda!"