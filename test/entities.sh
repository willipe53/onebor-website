#!/bin/bash
set -e

REGION="us-east-2"
API_ID="zwkvk3lyl3"
LAMBDA_NAME="updatePandaEntityType"
ACCOUNT_ID="316490106381"

# 1. Find /post resource ID
POST_ID=$(aws apigateway get-resources \
  --rest-api-id $API_ID \
  --region $REGION \
  --query "items[?path=='/post'].id" \
  --output text)

if [ -n "$POST_ID" ]; then
  echo "Deleting old /post resource ($POST_ID)..."
  aws apigateway delete-resource \
    --rest-api-id $API_ID \
    --resource-id $POST_ID \
    --region $REGION
else
  echo "No /post resource found, skipping delete."
fi

# 2. Get root resource ID
ROOT_ID=$(aws apigateway get-resources \
  --rest-api-id $API_ID \
  --region $REGION \
  --query "items[?path=='/'].id" \
  --output text)

echo "Root resource ID: $ROOT_ID"

# 3. Create /update_entity_type resource
UPDATE_ID=$(aws apigateway create-resource \
  --rest-api-id $API_ID \
  --parent-id $ROOT_ID \
  --path-part "update_entity_type" \
  --region $REGION \
  --query "id" \
  --output text)

echo "Created /update_entity_type resource ($UPDATE_ID)"

# 4. Get Cognito authorizer ID
AUTHORIZER_ID=$(aws apigateway get-authorizers \
  --rest-api-id $API_ID \
  --region $REGION \
  --query "items[?name=='PandaCognitoAuthorizer'].id" \
  --output text)

echo "Using
