from utils import greet

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': greet("World")
    }