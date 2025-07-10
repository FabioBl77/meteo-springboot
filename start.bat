@echo off

echo -------------------------------------
echo Arresto di eventuali container attivi...
echo -------------------------------------
docker-compose down

echo -------------------------------------
echo Build e avvio container Docker...
echo -------------------------------------
docker-compose up --build
