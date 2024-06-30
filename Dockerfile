FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY . /usr/share/nginx/html/assets  # Assuming image folder

# Assuming contact form data is processed in PHP
COPY contact-form-process.php /var/www/html/
USER 10014
RUN apk add --no-cache php php-fpm

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

