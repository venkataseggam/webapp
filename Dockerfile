FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum -y install epel-release
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
ADD nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/tmp/nginx && \
    chown -R 1001:0 /var/log/nginx /var/tmp/nginx
RUN sed -i 's|pid /run/nginx/nginx.pid;|pid /var/tmp/nginx/nginx.pid;|' /etc/nginx/nginx.conf
EXPOSE 8080
USER 1001
CMD ["nginx", "-g", "daemon off;"]
