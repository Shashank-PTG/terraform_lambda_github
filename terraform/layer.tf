resource "aws_lambda_layer_version" "utils_layer" {
  filename   = var.layer_zip_path
  layer_name = var.layer_name
  compatible_runtimes = [var.lambda_runtime]

  source_code_hash = filebase64sha256(var.layer_zip_path)
}
  output "layer_arn" {
    value = aws_lambda_layer_version.utils_layer.arn
  }

