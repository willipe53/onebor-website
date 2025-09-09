#!/bin/zsh
aws s3 sync . s3://onebor-web-root --recursive --profile onebor --exclude ".git*" 
aws cloudfront create-invalidation --distribution-id="EPZLOBGCZS220" --profile onebor --paths "/*"
