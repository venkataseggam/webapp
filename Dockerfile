FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum -y install epel-release
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
ADD nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/run/nginx && \
    chown -R 1001:0 /var/log/nginx /var/run/nginx
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
