# aws apigateway create-rest-api \
#   --name "panda" \
#   --region us-east-2
#
# {
#   "id": "zwkvk3lyl3",
#   "name": "panda",
#   "createdDate": "2025-09-15T16:27:31-04:00",
#   "apiKeySource": "HEADER",
#   "endpointConfiguration": {
#       "types": [
#           "EDGE"
#       ]
#   },
#   "disableExecuteApiEndpoint": false,
#   "rootResourceId": "8g4tsavqdg"
# }

# aws apigateway get-resources \
# --rest-api-id zwkvk3lyl3 \
# --region us-east-2
#
# "id": "8g4tsavqdg",
# "path": "/"

# aws apigateway create-resource \
#   --rest-api-id zwkvk3lyl3 \
#   --parent-id 8g4tsavqdg \
#   --path-part "get_entity_types" \
#   --region us-east-2
#
# {
#     "id": "8h69bu",
#     "parentId": "8g4tsavqdg",
#     "pathPart": "post",
#     "path": "/post"
# }

# aws apigateway create-authorizer \
#   --rest-api-id zwkvk3lyl3 \
#   --name "PandaCognitoAuthorizer" \
#   --type COGNITO_USER_POOLS \
#   --provider-arns arn:aws:cognito-idp:us-east-2:316490106381:userpool/us-east-2_IJ1C0mWXW \
#   --identity-source "method.request.header.Authorization" \
#   --region us-east-2
#
# {
#     "id": "5tr2r9",
#     "name": "PandaCognitoAuthorizer",
#     "type": "COGNITO_USER_POOLS",
#     "providerARNs": [
#         "arn:aws:cognito-idp:us-east-2:316490106381:userpool/us-east-2_IJ1C0mWXW"
#     ],
#     "authType": "cognito_user_pools",
#     "identitySource": "method.request.header.Authorization"
# }

# aws apigateway put-method \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id 8h69bu \
#   --http-method POST \
#   --authorization-type COGNITO_USER_POOLS \
#   --authorizer-id 5tr2r9 \
#   --region us-east-2

# aws apigateway put-integration \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id 8h69bu \
#   --http-method POST \
#   --type AWS_PROXY \
#   --integration-http-method POST \
#   --uri arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:getPandaEntityTypes/invocations \
#   --region us-east-2
#
# {
#     "type": "AWS_PROXY",
#     "httpMethod": "POST",
#     "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:getPandaEntityTypes/invocations",
#     "passthroughBehavior": "WHEN_NO_MATCH",
#     "timeoutInMillis": 29000,
#     "cacheNamespace": "8h69bu",
#     "cacheKeyParameters": []
# }

# aws lambda add-permission \
#   --function-name getPandaEntityTypes \
#   --statement-id apigateway-post \
#   --action lambda:InvokeFunction \
#   --principal apigateway.amazonaws.com \
#   --source-arn arn:aws:execute-api:us-east-2:316490106381:zwkvk3lyl3/*/POST/post \
#   --region us-east-2
#
# {
#     "Statement": "{\"Sid\":\"apigateway-post\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"lambda:InvokeFunction\",\"Resource\":\"arn:aws:lambda:us-east-2:316490106381:function:getPandaEntityTypes\",\"Condition\":{\"ArnLike\":{\"AWS:SourceArn\":\"arn:aws:execute-api:us-east-2:316490106381:zwkvk3lyl3/*/POST/post\"}}}"
# }

# aws apigateway create-deployment \
#   --rest-api-id zwkvk3lyl3 \
#   --stage-name dev \
#   --region us-east-2

# aws cognito-idp initiate-auth \
#   --auth-flow USER_PASSWORD_AUTH \
#   --client-id 1lntksiqrqhmjea6obrrrrnmh1 \
#   --auth-parameters USERNAME=115b95d0-d041-702e-121b-f4064b729d7c,PASSWORD=LiBoR45% \
#   --region us-east-2
#
# {
#     "ChallengeParameters": {},
#     "AuthenticationResult": {
#         "AccessToken": "eyJ...NyQ",
#         "ExpiresIn": 3600,
#         "TokenType": "Bearer",
#         "RefreshToken": "eyJ...U7g",
#         "IdToken": "eyJ...Jg"
#     }
# }

# curl -X POST \
#   -H "Authorization: eyJ...Jg" \
#   https://zwkvk3lyl3.execute-api.us-east-2.amazonaws.com/dev/post

# ------ FINISHED FIRST DRAFT -------

# aws apigateway delete-resource \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id 8h69bu \
#   --region us-east-2

# aws apigateway create-resource \
# --rest-api-id zwkvk3lyl3 \
# --parent-id 8g4tsavqdg \
# --path-part "update_entity_type" \
# --region us-east-2
#
# {
#     "id": "68f59x",
#     "parentId": "8g4tsavqdg",
#     "pathPart": "update_entity_type",
#     "path": "/update_entity_type"
# }

# aws apigateway put-method \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id 68f59x \
#   --http-method POST \
#   --authorization-type COGNITO_USER_POOLS \
#   --authorizer-id 5tr2r9 \
#   --region us-east-2
#
# {
#   "httpMethod": "POST",
#   "authorizationType": "COGNITO_USER_POOLS",
#   "authorizerId": "5tr2r9",
#   "apiKeyRequired": false
# }

# aws apigateway put-integration \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id 68f59x \
#   --http-method POST \
#   --type AWS_PROXY \
#   --integration-http-method POST \
#   --uri arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntityType/invocations \
#   --region us-east-2
#
# {
#     "type": "AWS_PROXY",
#     "httpMethod": "POST",
#     "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntityType/invocations",
#     "passthroughBehavior": "WHEN_NO_MATCH",
#     "timeoutInMillis": 29000,
#     "cacheNamespace": "68f59x",
#     "cacheKeyParameters": []
# }

# aws lambda add-permission \
#   --function-name updatePandaEntityType \
#   --statement-id apigateway-update-entity-type \
#   --action lambda:InvokeFunction \
#   --principal apigateway.amazonaws.com \
#   --source-arn arn:aws:execute-api:us-east-2:316490106381:zwkvk3lyl3/*/POST/update_entity_type \
#   --region us-east-2
#
# {
#     "Statement": "{\"Sid\":\"apigateway-update-entity-type\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"lambda:InvokeFunction\",\"Resource\":\"arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntityType\",\"Condition\":{\"ArnLike\":{\"AWS:SourceArn\":\"arn:aws:execute-api:us-east-2:316490106381:zwkvk3lyl3/*/POST/update_entity_type\"}}}"
# }

# aws apigateway create-deployment \
#   --rest-api-id zwkvk3lyl3 \
#   --stage-name dev \
#   --region us-east-2

########################## SECOND API ###########################

# aws apigateway get-resources \
#   --rest-api-id zwkvk3lyl3 \
#   --region us-east-2 \
#   --embed methods

# aws apigateway put-method \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id wkb3ro \
#   --http-method POST \
#   --authorization-type COGNITO_USER_POOLS \
#   --authorizer-id 5tr2r9 \
#   --region us-east-2
# {
#     "httpMethod": "POST",
#     "authorizationType": "COGNITO_USER_POOLS",
#     "authorizerId": "5tr2r9",
#     "apiKeyRequired": false
# }

# aws apigateway put-integration \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id wkb3ro \
#   --http-method POST \
#   --type AWS_PROXY \
#   --integration-http-method POST \
#   --uri arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:getPandaEntityTypes/invocations \
#   --region us-east-2
# {
#     "type": "AWS_PROXY",
#     "httpMethod": "POST",
#     "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:getPandaEntityTypes/invocations",
#     "passthroughBehavior": "WHEN_NO_MATCH",
#     "timeoutInMillis": 29000,
#     "cacheNamespace": "wkb3ro",
#     "cacheKeyParameters": []
# }

# aws apigateway create-deployment \
#   --rest-api-id zwkvk3lyl3 \
#   --stage-name dev \
#   --region us-east-2
# {
#     "id": "hpd6qk",
#     "createdDate": "2025-09-16T10:01:08-04:00"
# }

########################## THREE AND FOUR ###########################
# aws apigateway create-resource \
#   --rest-api-id zwkvk3lyl3 \
#   --parent-id 8g4tsavqdg \
#   --path-part update_entity \
#   --region us-east-2
# {
#     "id": "wqlsze",
#     "parentId": "8g4tsavqdg",
#     "pathPart": "update_entity",
#     "path": "/update_entity"
# }

# willipe@pwmacbook github % aws apigateway create-resource \
#   --rest-api-id zwkvk3lyl3 \
#   --parent-id 8g4tsavqdg \
#   --path-part get_entities \          
#   --region us-east-2
# {
#     "id": "mvonlv",
#     "parentId": "8g4tsavqdg",
#     "pathPart": "get_entities",
#     "path": "/get_entities"
# }

# willipe@pwmacbook github % aws apigateway put-method \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id aws apigateway put-method \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id wqlsze \                   
#   --http-method POST \    
#   --authorization-type COGNITO_USER_POOLS \
#   --authorizer-id 5tr2r9 \
#   --region us-east-2

# willipe@pwmacbook github % aws apigateway put-method \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id mvonlv \
#   --http-method POST \
#   --authorization-type COGNITO_USER_POOLS \
#   --authorizer-id 5tr2r9 \
#   --region us-east-2

# {
#     "httpMethod": "POST",
#     "authorizationType": "COGNITO_USER_POOLS",
#     "authorizerId": "5tr2r9",
#     "apiKeyRequired": false
# }

# aws apigateway put-integration \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id wqlsze \
#   --http-method POST \
#   --type AWS_PROXY \
#   --integration-http-method POST \
#   --uri arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntity/invocations \
#   --region us-east-2
#   {
#     "type": "AWS_PROXY",
#     "httpMethod": "POST",
#     "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntity/invocations",
#     "passthroughBehavior": "WHEN_NO_MATCH",
#     "timeoutInMillis": 29000,
#     "cacheNamespace": "wqlsze",
#     "cacheKeyParameters": []
# }

# aws apigateway put-integration \
#   --rest-api-id zwkvk3lyl3 \
#   --resource-id mvonlv \
#   --http-method POST \
#   --type AWS_PROXY \
#   --integration-http-method POST \
#   --uri arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntity/invocations \
#   --region us-east-2
# {
#     "type": "AWS_PROXY",
#     "httpMethod": "POST",
#     "uri": "arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:316490106381:function:updatePandaEntity/invocations",
#     "passthroughBehavior": "WHEN_NO_MATCH",
#     "timeoutInMillis": 29000,
#     "cacheNamespace": "mvonlv",
#     "cacheKeyParameters": []
# }

# aws apigateway create-deployment \
#   --rest-api-id zwkvk3lyl3 \
#   --stage-name dev \
#   --region us-east-2
# {
#     "id": "56iosg",
#     "createdDate": "2025-09-16T12:58:27-04:00"
# }

aws apigateway create-base-path-mapping \
  --domain-name api.onebor.com \
  --rest-api-id zwkvk3lyl3 \
  --stage dev \
  --base-path panda \
  --region us-east-2
