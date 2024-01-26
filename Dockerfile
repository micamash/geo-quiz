# Stage 1: Build the Vue.js frontend
FROM node:latest as build-stage
WORKDIR /app
COPY ./client/package*.json ./
RUN npm install
COPY ./client/ ./
RUN npm run build

# Stage 2: Build and run the Spring Boot backend
FROM openjdk:19-slim
WORKDIR /app

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

COPY --from=build-stage /app/dist /app/dist
COPY ./server/ /app/
RUN mvn clean package -DskipTests
EXPOSE 9000
CMD ["java", "-jar", "target/geo-quiz-0.0.1-SNAPSHOT.jar"]
