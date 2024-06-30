FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the entire directory into the container
COPY . .

# Expose the port 80
EXPOSE 80

USER 10012
# Run the command to start the web server
CMD ["python", "-m", "http.server", "80"]
