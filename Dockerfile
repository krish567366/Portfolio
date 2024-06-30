FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the entire directory into the container
COPY . .

# Install the http.server module
RUN pip install --no-cache-dir http.server

# Expose the port 80
EXPOSE 80

# Run the command to start the web server
CMD ["http.server", "80"]
