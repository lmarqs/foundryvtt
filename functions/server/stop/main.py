import boto3
import os

client = boto3.client('ec2')

instance_id = os.environ.get('INSTANCE_ID')

def lambda_handler(event, context):
  try:
    stop_instance()
    return {
      "statusCode": 200,
      "body": "Shutting down"
    }

  except Exception as e:
    return {
      "statusCode": 500,
      "body": str(e),
    }

def stop_instance():
  client.stop_instances(
    InstanceIds=[
      instance_id
    ]
  )
