#FROM openjdk:17-jdk-slim
#COPY target/demo-0.0.1-SNAPSHOT.jar app.jar
#ENTRYPOINT ["java", "-jar", "/app.jar"]

# Use the official OpenJDK base image for the Spring Boot application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file from your local machine to the Docker container
COPY target/user-management-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port (usually 8080)
EXPOSE 8080

# Set environment variables for H2
ENV SPRING_DATASOURCE_URL=jdbc:h2:mem:testdb
ENV SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.h2.Driver
ENV SPRING_DATASOURCE_USERNAME=sa
ENV SPRING_DATASOURCE_PASSWORD=
ENV SPRING_JPA_HIBERNATE_DDL_AUTO=update
ENV SPRING_JPA_DATABASE_PLATFORM=org.hibernate.dialect.H2Dialect
ENV SPRING_APPLICATION_NAME=user-management

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

