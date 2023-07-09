import boto3
import os

client = boto3.client('ec2')

instance_id = os.environ.get('INSTANCE_ID')

def lambda_handler(event, context):
  stop_instance()

  return {
    "statusCode": 200,
    "body": "Shutting down"
  }

def stop_instance():
  client.stop_instances(
    InstanceIds=[
      instance_id
    ]
  )
