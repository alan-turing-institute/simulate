#!/bin/bash

echo "INFO: removing simulate_middleware_volume"
docker volume rm simulate_middleware_volume

echo "INFO: removing simulate_auth_volume"
docker volume rm simulate_auth_volume
