# Use a slim Apache base image
FROM php:apache

# Create directory for logs (optional)
RUN mkdir -p /var/log/apache2

# Set environment variables (replace with your desired values)
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

# Option 1: Set DefaultRuntimeDir directly (if not using APACHE_RUN_DIR)
RUN echo "DefaultRuntimeDir /var/run/apache2" >> /etc/apache2/apache2.conf

# Option 2 (Uncomment if using APACHE_RUN_DIR):
#  Ensure the corresponding line in `/etc/apache2/apache2.conf` is set correctly (e.g., SetEnv APACHE_RUN_DIR /path/to/directory)

# Copy your application code
COPY . /var/www/html

# Set user to avoid permission issues (optional)
USER $APACHE_RUN_USER  # Use the environment variable for consistency

# Expose port 80
EXPOSE 80

# Use CMD to specify the startup command (fixed typo)
CMD ["apache2", "-f", "/etc/apache2/apache2.conf"]

