# Use a Java 11 runtime image as the base image
FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory to /app
WORKDIR /app

# Copy the build files from the host to the container
COPY build/libs/*.jar app.jar

# Expose port 8080 for the container
EXPOSE 8080

# Set the command to run when the container starts
CMD ["java", "-jar", "app.jar"]