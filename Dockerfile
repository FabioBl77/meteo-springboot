# Fase 1: Build del progetto
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copia pom.xml e scarica le dipendenze
COPY pom.xml .
RUN mvn dependency:go-offline

# Copia il codice sorgente e costruisce il jar
COPY src ./src
RUN mvn clean package -DskipTests

# Fase 2: Immagine finale leggera
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copia il jar dalla fase di build
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
