FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY assets /usr/share/nginx/html/assets  # Assuming image folder

# Assuming contact form data is processed in PHP
COPY contact-form-process.php /var/www/html/

RUN apk add --no-cache php php-fpm

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

