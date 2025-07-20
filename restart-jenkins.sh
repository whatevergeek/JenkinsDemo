#!/bin/bash

# Stop the current container
docker-compose down

# Start it again with the new configuration
docker-compose up -d

echo "Jenkins restarted. Access it at http://localhost:8081"