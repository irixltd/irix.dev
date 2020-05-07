#!/bin/bash

docker ps -a

source "${BASH_SOURCE%/*}/env.sh"

echo "TAG=$TAG"

echo $GITHUB_PERSONAL_TOKEN | docker login https://docker.pkg.github.com -u mattcroberts --password-stdin

docker-compose -f docker-compose.yml \
    -f ./tictactoe/docker-compose.prod.yml \
    -f ./rightmove-commute/docker-compose.yml \
    -f ./metrix/docker-compose.yml \
    up \
    -d \
    --remove-orphans

sleep 5

docker ps -a

curl --fail https://irix.dev/ && curl --fail https://irix.dev/tictactoe