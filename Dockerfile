FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
COPY nginx-template.conf /etc/nginx/nginx-template.conf
RUN sed -i 's/{{PORT}}/8080/g' /etc/nginx/nginx-template.conf
RUN cp /etc/nginx/nginx-template.conf /etc/nginx/nginx.conf
RUN chown -R 1001:0 /var/run/nginx && \
    chown -R 1001:0 /var/lib/nginx && \
    chmod -R g+rw /var/run/nginx && \
    chmod -R g+rw /var/lib/nginx
EXPOSE 8080
USER 1001
CMD ["nginx", "-g", "daemon off;"]
