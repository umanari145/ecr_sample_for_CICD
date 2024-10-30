#!/bin/bash

deploy_image() {
    container_name=$1
    app_name=$2
    dockerfile=$3

    docker build -t ${container_name} . -f ${dockerfile} --no-cache
    docker tag ${container_name}:latest registry.heroku.com/${app_name}/web:latest
    docker push registry.heroku.com/${app_name}/web:latest
    heroku container:release web -a ${app_name}
}

deploy_image $1 $2 $3