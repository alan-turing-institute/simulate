#!/bin/bash

echo "INFO: running postgres container"
docker-compose run postgres &
docker-compose run postgres_auth &


echo "INFO: please wait, postgres and postgres_auth containers will shut down in 10 seconds"
sleep 10
docker-compose down
