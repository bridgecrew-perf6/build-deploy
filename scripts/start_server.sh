#!/bin/bash
cd /home/ec2-user/************
docker kill server-prod
docker rm server-prod
docker rmi ************.dkr.ecr.ap-northeast-1.amazonaws.com/server-prod
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ************.dkr.ecr.ap-northeast-1.amazonaws.com
docker pull ************.dkr.ecr.ap-northeast-1.amazonaws.com/server-prod:latest
docker run -p ${APP_PORT:-80}:80 -e WWWUSER=${WWWUSER} --name server-prod --rm -d ************.dkr.ecr.ap-northeast-1.amazonaws.com/server-prod