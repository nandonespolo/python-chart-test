#!/bin/bash

set -e

source variables_global

# build docker image
docker build -t "${APP_NAME}" .

# create the ecr repository
if [[ -z $(aws ecr describe-repositories --repository-names "${APP_NAME}") ]]; 
then
    aws ecr create-repository --repository-name "${APP_NAME}" >/dev/null 2>&1;
fi

# tag docker image
docker tag "${APP_NAME}":latest "${ACCOUNT_ID}".dkr.ecr."${AWS_REGION}".amazonaws.com/"${APP_NAME}":latest

# login to AWS ECR
aws ecr get-login-password --region "${AWS_REGION}" | docker login --username AWS --password-stdin "${ACCOUNT_ID}".dkr.ecr."${AWS_REGION}".amazonaws.com

# push image to AWS ECR
docker push "${ACCOUNT_ID}".dkr.ecr."${AWS_REGION}".amazonaws.com/"${APP_NAME}":latest

# run the container locally
# docker run -td -p 5000:5000 --name "${APP_NAME}" "${APP_NAME}"

# deploy the app to kubernetes using the helm chart
helm3 upgrade -i "${APP_NAME}" python-chart --namespace default
