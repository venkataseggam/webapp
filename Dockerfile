FROM ubuntu
RUN apt-get update && apt-get install -y nginx
COPY index.html /var/www/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf
RUN cat /var/www/html/index.html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
