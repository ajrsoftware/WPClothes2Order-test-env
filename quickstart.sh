#!bin/bash

# If config exists
if [ -d "app" ]; then
  echo "'app' directory already exists, if you wish to perform a fresh test env installaiton, please remove this directory";
  echo "Warning! This action will setup a fresh test env installation";
  exit 0;
fi

docker compose down;
docker compose down --volumes;
docker compose up -d;
docker exec -i wordpress sh < install.sh;
