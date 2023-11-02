FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install nginx && \
    yum clean all && \
    rm -rf /var/cache/yum
RUN rm -f /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
