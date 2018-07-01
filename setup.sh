#!/bin/bash

echo "INFO: running postgres container"

echo "INFO: please wait, postgres container will shut down in 5 seconds"
docker-compose run postgres &
sleep 5
docker-compose down

echo "INFO: please wait, postgres_auth container will shut down in 5 seconds"
docker-compose run postgres_auth &
sleep 5
docker-compose down
