# 1- S3 Bucket to store Lambda Code
resource "aws_s3_bucket" "lambda_bucket" {
    bucket = "my-lambda-bucket-unique-name-120599"
    force_destroy = true

    tags = {
      Name = "LambdaBucket"
    }
}

# 2- Upload Lambda Code to S3
resource "aws_s3_object" "Lambda_code" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key = "lambda_function.zip"
  source = "lambda_function.zip"
  etag = filemd5("lambda_function.zip")
  
}

# 3- IAM Role for Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"

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

# 4- Attach Policy to IAM Role
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

}

# 5- Lambda Function
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  runtime = "python3.9"
  role = aws_iam_role.lambda_exec_role.arn
  handler = "lambda_function.lambda_handler"
  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key = aws_s3_object.Lambda_code.key
  timeout = 100
  memory_size = 128
  
}