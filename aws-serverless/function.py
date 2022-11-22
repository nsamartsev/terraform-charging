from email import message
import boto3
import os
import datetime

OWNER_NAME = os.environ['OWNER_NAME']

def handler(event, context):
    try:
        message = {
            "owner" : OWNER_NAME,
            "message" : "This is AWS API Gateway plus AWS Lambda",
            "runtime" : str(datetime.datetime.now()) 
        }
    except Exception as error:
        print("Error occuried! Error Message: " + str(error))

    return message