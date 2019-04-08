#!/bin/bash

docker ps -a

source "${BASH_SOURCE%/*}/env.sh"

echo "TAG=$TAG"

docker-compose -f docker-compose.yml -f ./tictactoe/docker-compose.prod.yml up -d

docker-compose -f docker-compose.yml -f ./tictactoe/docker-compose.prod.yml exec nginx nginx -t
docker-compose -f docker-compose.yml -f ./tictactoe/docker-compose.prod.yml exec nginx nginx -s reload

sleep 5

docker ps -a

curl --fail https://irix.dev/ && curl --fail https://irix.dev/tictactoe