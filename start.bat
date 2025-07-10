@echo off
echo -------------------------------------
echo Maven build in corso...
echo -------------------------------------
call mvnw.cmd clean package -DskipTests

if errorlevel 1 (
    echo Errore nella compilazione. Interruzione.
    exit /b 1
)

echo -------------------------------------
echo Arresto di eventuali container attivi...
echo -------------------------------------
docker-compose down

echo -------------------------------------
echo Build e avvio container Docker...
echo -------------------------------------
docker-compose up --build
