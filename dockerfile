# Use a Java 11 runtime image as the base image
FROM openjdk:20-ea-17-bullseye

# Set the working directory to /app
WORKDIR /app

# Copy the build files from the host to the container
COPY build/libs/demo-0.0.1-SNAPSHOT.jar /app.jar

# Expose port 8080 for the container
EXPOSE 8090

# Set the command to run when the container starts
CMD ["java", "-jar", "/app.jar"]
