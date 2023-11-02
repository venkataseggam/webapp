FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum -y install epel-release
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
RUN sudo chown -R 1001:0 /var/lib/nginx && sudo chmod -R g+rw /var/lib/nginx
EXPOSE 8090
CMD ["nginx", "-g", "daemon off;"]
