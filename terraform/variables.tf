variable "aws_region" {
  description = "AWS region to deploy resources"
  type = string
  default = "us-east-1"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type = string
  default = "MyLambda"
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type = string
  default = "app.handler"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type = string
  default = "python3.9"
}

variable "lambda_zip_path" {
  description = "Path to lambda zip function"
  type = string
  default = "../lambda.zip"
}

variable "layer_name" {
  description = "Name of Lambda Layer"
  type = string
  default = "utils-layer"
}


variable "layer_zip_path" {
  description = "Path to lambda layer zip file"
  type = string
  default = "../layer.zip"
}