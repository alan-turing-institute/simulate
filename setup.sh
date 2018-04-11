#!/bin/bash

echo "INFO: running postgres container"
docker-compose run postgres &

echo "INFO: please wait, postgres container will shut down in 5 seconds"
sleep 5
docker-compose down
