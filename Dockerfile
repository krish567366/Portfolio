# Use a lightweight Apache image with PHP support
FROM php:apache

# Create the directory for Apache runtime files (recommended)
RUN mkdir -p /var/run/apache2

# (Optional) Define an environment variable for flexibility
ENV APACHE_RUN_DIR /var/run/apache2

# Copy your HTML and PHP files to the Apache document root
COPY . /var/www/html

# Set a non-root user (optional, adjust user ID if needed)
USER 10014

# Expose the default Apache port (80)
EXPOSE 80

# Set the entrypoint to serve the index.html file
ENTRYPOINT ["apache2", "-f", "/etc/apache2/apache2.conf"]

