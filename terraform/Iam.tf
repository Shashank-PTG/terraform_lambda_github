resource "random_id" "suffix" {
  byte_length = 4
  
}

resource "aws_iam_role" "lambda_exec" {
    name = "lambda_exec_role-${random_id.suffix.hex}"
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

resource "aws_iam_role_policy_attachment" "lambda_exec_basic" {
    role       = aws_iam_role.lambda_exec.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}