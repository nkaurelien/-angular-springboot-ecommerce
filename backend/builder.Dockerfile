# FROM maven:3.9.5-ibmjava AS builder
# FROM maven:latest AS builder
# FROM maven:latest AS builder
FROM ubuntu:22.04

# Update the package lists
RUN apt-get update

# Install Maven and OpenJDK 17
RUN apt-get install -y maven openjdk-17-jdk

# Set the working directory
WORKDIR /app

# Copy the project files
COPY pom.xml .
COPY src src

# Build the JAR
RUN mvn clean package

# Optional: Build a Spring Boot image (if applicable)
# RUN mvn spring-boot:build-image