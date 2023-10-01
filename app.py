#!/usr/bin/env python3

import os, boto3

import aws_cdk as cdk

from my_project.constructs.my_project_stack import MyProjectStack
from my_project.constructs.s3_construct import S3Stack

#session = boto3.session.Session()
#print(session.region_name)

app = cdk.App()

S3Stack(app, "S3Stack")

#MyProjectStack(app, "MyProjectStack",

    # If you don't specify 'env', this stack will be environment-agnostic.
    # Account/Region-dependent features and context lookups will not work,
    # but a single synthesized template can be deployed anywhere.

    # Uncomment the next line to specialize this stack for the AWS Account
    # and Region that are implied by the current CLI configuration.

    #env=cdk.Environment(account=os.getenv('CDK_DEFAULT_ACCOUNT'), region=os.getenv('CDK_DEFAULT_REGION')),

    # Uncomment the next line if you know exactly what Account and Region you
    # want to deploy the stack to. */

    #env=cdk.Environment(account='123456789012', region='us-east-1'),

    # For more information, see https://docs.aws.amazon.com/cdk/latest/guide/environments.html

    #)

app.synth()
