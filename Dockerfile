# Usa una immagine leggera con Java 17
FROM eclipse-temurin:17-jdk-alpine

# Crea una cartella di lavoro
WORKDIR /app

# Copia il file JAR (rinominato in app.jar)
COPY target/*.jar app.jar

# Espone la porta dell'app (Spring Boot di default è 8080)
EXPOSE 8080

# Comando per avviare l'app
ENTRYPOINT ["java", "-jar", "app.jar"]
