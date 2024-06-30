FROM php:7.4-apache

# Set the working directory to /app
WORKDIR /app

# Copy the entire directory into the container
COPY . .

# Expose the port 80
EXPOSE 80

# Enable the Apache mod_rewrite module
RUN a2enmod rewrite

USER 10014
# Configure Apache to use index.html as the default index page
RUN chown 10014:10014 /etc/apache2/apache2.conf
RUN sed -i -e '$i\DirectoryIndex index.html' /etc/apache2/apache2.conf

# Restart Apache to apply changes
RUN service apache2 restart

# Run the command to start the Apache web server
CMD ["apache2", "-D", "FOREGROUND"]
