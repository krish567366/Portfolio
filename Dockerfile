# Use a lightweight Apache image
FROM php:apache

# Copy your HTML and PHP files to the Apache document root
COPY . /var/www/html

USER 10014

# Expose the default Apache port (80)
EXPOSE 80

# Set the entrypoint to serve the index.html file
ENTRYPOINT ["apache2", "-D", "FOREGROUND"]

