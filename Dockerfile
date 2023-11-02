FROM nginxinc/nginx-unprivileged:stable-alpine
ADD index.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
