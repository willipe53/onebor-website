# Lambda security group (for functions that need to reach RDS)
# aws ec2 create-security-group \
#   --group-name LambdaRdsSecGroup \
#   --description "Security group for Lambda to connect to RDS" \
#   --vpc-id vpc-05694661cd35645a5 \
#   --region us-east-2

# "GroupId": "sg-0a5a4038d1f4307f2"

# RDS security group (for the database itself)
# aws ec2 create-security-group \
#   --group-name RdsLambdaSecGroup \
#   --description "Security group for RDS to accept connections from Lambda" \
#   --vpc-id vpc-05694661cd35645a5 \
#   --region us-east-2

# "GroupId": "sg-017a0e50df608462e"

# Allow inbound MySQL traffic from Lambda SG to RDS SG
# aws ec2 authorize-security-group-ingress \
#   --group-id sg-017a0e50df608462e \
#   --protocol tcp \
#   --port 3306 \
#   --source-group sg-0a5a4038d1f4307f2 \
#   --region us-east-2

# aws ec2 revoke-security-group-egress \
#   --group-id sg-0a5a4038d1f4307f2 \
#   --protocol -1 \
#   --port all \
#   --cidr 0.0.0.0/0 \
#   --region us-east-2

# aws rds modify-db-instance \
#   --db-instance-identifier panda-db \
#   --vpc-security-group-ids sg-017a0e50df608462e \
#   --apply-immediately \
#   --region us-east-2

aws ec2 describe-network-interfaces \
  --network-interface-ids eni-055d8c706a5b8b5f8 eni-04708258f27206e68 eni-058debb736c2fde57 \
  --region us-east-2 \
  --query "NetworkInterfaces[].{ENI:NetworkInterfaceId,Groups:Groups[*].GroupId}"
  


