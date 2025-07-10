#!/bin/bash

echo "-------------------------------------"
echo "Compilazione Maven in corso..."
echo "-------------------------------------"
./mvnw clean package -DskipTests

if [ $? -ne 0 ]; then
  echo "Errore nella compilazione. Interruzione."
  exit 1
fi

echo "-------------------------------------"
echo "Arresto di eventuali container attivi..."
echo "-------------------------------------"
docker-compose down

echo "-------------------------------------"
echo "Build e avvio container Docker..."
echo "-------------------------------------"
docker-compose up --build
