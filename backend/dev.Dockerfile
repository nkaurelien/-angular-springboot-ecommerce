FROM openjdk:17.0.1-jdk-slim

# Update the package lists
RUN apt-get update

# Install Maven and OpenJDK 17
RUN apt-get install -y maven
RUN echo "$(mvn --version)"
WORKDIR /app

# Copy the project files
COPY pom.xml .
COPY src src

EXPOSE 8080

# RUN mvn clean install

CMD ["./mvnw", "spring-boot:run", "--port=9000"]