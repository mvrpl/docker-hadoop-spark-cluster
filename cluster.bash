#!/bin/bash

if [ $# -eq 0 ];then
    echo "SEND 'start' OR 'stop' ARG"
    exit 1
fi

if [ $1 == "start" ];then
    docker-compose up -d

    sudo tee -a <<EOF /etc/hosts
# ---- DOCKER HADOOP CLUSTER ---- #
$(docker ps -q | xargs -n1 docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{.Config.Hostname}}')
# ---- DOCKER HADOOP CLUSTER ---- #
EOF
fi

if [ $1 == "stop" ];then
    docker-compose down
    sudo gsed -i '/DOCKER HADOOP CLUSTER/,/DOCKER HADOOP CLUSTER/d' /etc/hosts
fi