import json

def run_handler(event, context):

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({'message': 'success!'})
    }