#!/bin/bash

echo "INFO: removing simulate_middleware_volume"
docker volume rm integration_middleware_volume

echo "INFO: removing simulate_auth_volume"
docker volume rm integration_auth_volume
