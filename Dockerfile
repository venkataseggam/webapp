FROM centos
RUN yum -y install nginx
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80/tcp
CMD ["nginx", "-g", "daemon off;"]
