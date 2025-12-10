import json
import boto3

def lambda_handler(event, context):
  client = boto3.client('ec2')
  response = client.run_instances(
    ImageId='ami-0d176f79571d18a8f',
    InstanceType='t3.micro',
    keyName='PROJECT',
    MaxCount=1
    MinCount=1
  )