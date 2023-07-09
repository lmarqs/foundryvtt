import boto3
import http.client
import json
import os

s3 = boto3.client("s3")

download_url = os.environ.get("DOWNLOAD_URL")
s3_bucket = os.environ.get("S3_BUCKET")

def lambda_handler(event, context):
  print(json.dumps(event))

  params = event.get("queryStringParameters")

  world = params.get("world")

  download_url = params.get("downloadUrl")

  data = download_file(download_url)

  if len(data) < 10000:
    raise Exception(f"if downloaded data is shorter than 10000. {len(data)}")

  s3.put_object(
    Bucket=s3_bucket,
    Body=data,
    Key=f"{world}/foundryvtt.zip"
  )

  print("it actually succeeded...")

  return {
    "statusCode": 200,
    "headers": {
      "Content-Type": "text/plain"
    },
    "body": "Success"
  }

def download_file(download_url):
  conn = http.client.HTTPSConnection(download_url.split("https://")[1].split("/releases")[0])

  conn.request("GET", download_url.split('.com')[1])

  res = conn.getresponse()

  return res.read()
