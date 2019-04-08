#!/bin/bash

docker ps -a

source "${BASH_SOURCE%/*}/env.sh"

echo "TAG=$TAG"

docker-compose -f docker-compose.yml -f ./tictactoe/docker-compose.prod.yml up -d

sleep 5

docker ps -a

curl --fail https://irix.dev/ && curl --fail https://irix.dev/tictactoe