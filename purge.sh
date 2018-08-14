#!/bin/bash

echo "INFO: removing simulate_database"
docker volume rm simulate_database

echo "INFO: removing simulate_database_auth"
docker volume rm simulate_database_auth
