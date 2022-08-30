#!bin/bash

docker compose down --volumes;
docker compose up -d
docker exec -i wordpress sh < install.sh
