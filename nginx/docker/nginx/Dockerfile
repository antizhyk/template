FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx
RUN apt-get update -y
RUN apt-get install apache2-utils -y