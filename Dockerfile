FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

COPY gradlew .
COPY gradle/wrapper gradle/wrapper
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

RUN chmod +x gradlew && ./gradlew clean bootJar --no-daemon

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/build/libs/*.jar app.jar

# Koyeb automatically sets PORT environment variable
ENV PORT=8080

EXPOSE 8080

# Use the PORT env variable that Koyeb provides
CMD ["sh", "-c", "java -jar -Dserver.port=${PORT:-8080} /app/app.jar"]