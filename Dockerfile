# Stage 1: Build PHP application (based on php:latest)
FROM php:latest AS builder

WORKDIR /app

# Copy your PHP application code here
COPY . .

# Install dependencies (replace with your actual commands)
RUN apt-get update && apt-get install -y php-fpm php-mysqli

# Compile or build your PHP application (replace with your commands)
RUN composer install

# Stage 2: Create final image (based on nginx:alpine)
FROM nginx:alpine

# Copy the compiled application files from the builder stage
COPY --from=builder /app/public /usr/share/nginx/html

# Configure Nginx (replace with your actual configuration)
USER 10014

EXPOSE 80

# Start php-fpm and Nginx processes
CMD ["php-fpm", "-F", "& nginx -g 'daemon off;'"]

