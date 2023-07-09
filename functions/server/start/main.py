from time import sleep
import boto3
import json
import os

ec2 = boto3.client('ec2')
route = boto3.client('route53')

domain_name = os.environ.get('DOMAIN_NAME')
instance_id = os.environ.get('INSTANCE_ID')

def lambda_handler(event, context):
  print(json.dumps(event))

  if is_instance_running():
      print('is already running')
      return redirect()

  print('is not yet running')

  start_instance()

  print('instances started')

  while not is_instance_running():
    sleep(1)

  print('is running now')

  return redirect()

def describe_instance():
  response = ec2.describe_instances(
    InstanceIds=[
      instance_id
    ]
  )

  return response['Reservations'][0]['Instances'][0]

def start_instance():
  ec2.start_instances(
    InstanceIds=[
      instance_id
    ]
  )

def is_instance_running():
  return describe_instance()['State']['Name'] == 'running'

def redirect():
  return {
    'statusCode': 301,
    'headers':{
      'Location': f'https://{domain_name}',
      'Cache-Control': 'no-store, max-age=0'
    }
  }
