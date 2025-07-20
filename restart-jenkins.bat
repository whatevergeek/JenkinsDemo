@echo off
echo Stopping Jenkins container...
docker-compose down

echo Starting Jenkins with new configuration...
docker-compose up -d

echo Jenkins restarted. Access it at http://localhost:8081