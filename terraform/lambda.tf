resource "aws_lambda_function" "my_lambda" {
  function_name = "MyLambda"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "app.handler"
  runtime       = "python3.9"
  filename      = "${path.module}/../lambda.zip"

  layers        = [aws_lambda_layer_version.utils_layer.arn]

  source_code_hash = filebase64sha256("${path.module}/../lambda.zip")
  
}