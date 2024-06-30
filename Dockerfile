# Use a slim Apache base image
FROM php:apache

# Create directory for logs (optional)
RUN mkdir -p /var/log/apache2

# Set environment variables (replace with your desired values)
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

# Copy your application code
COPY . /var/www/html
USER 10012
# Expose port 80
EXPOSE 80

# Use CMD to specify the startup command
CMD ["apache2", "-f", "/etc/apache2/apache2.conf"]

