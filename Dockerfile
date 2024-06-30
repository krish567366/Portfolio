# Use an official PHP 7.4 image as a base
FROM php:7.4-apache

# Create a new group and user with ID 10014
RUN groupadd -g 10014 choreo && useradd -u 10014 -g 10014 choreo

# Switch to the choreo user
USER 10014

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Enable the Apache rewrite module
RUN a2enmod rewrite

# Copy the Apache configuration file and set its ownership


# Change the ownership of the Apache configuration file
RUN chown 10014:10014 /etc/apache2/apache2.conf

# Configure Apache to use index.html as the default index page
RUN sed -i -e '$i\DirectoryIndex index.html' /etc/apache2/apache2.conf

# Configure Apache to use index.html as the default index page 
RUN echo "DirectoryIndex index.html" >> /etc/apache2/apache2.conf 
RUN service apache2 restart 
CMD ["apache2", "-D", "FOREGROUND"]



