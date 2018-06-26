#!/bin/bash

echo "INFO: removing gateway_database"
docker volume rm gateway_database

echo "INFO: removing gateway_database_auth"
docker volume rm gateway_database_auth
