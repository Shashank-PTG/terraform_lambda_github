data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "../lambda"    # relative to terraform folder
  output_path = "lambda.zip"
}

resource "aws_lambda_function" "my_lambda" {
  function_name      = "MyLambda"
  role               = aws_iam_role.lambda_exec.arn
  handler            = "app.handler"
  runtime            = "python3.9"
  filename           = data.archive_file.lambda_zip.output_path
  source_code_hash   = data.archive_file.lambda_zip.output_base64sha256
  layers             = [aws_lambda_layer_version.utils_layer.arn]
}
