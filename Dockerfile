#FROM nginx:alpine
#COPY index.html /usr/share/nginx/html/index.html


FROM alpine:3.9.4
RUN apk update  
RUN apk add nginx 
RUN adduser -D -g 'www' www 
RUN  mkdir -p /run/nginx 
RUN  mkdir -p /usr/share/nginx/html/
RUN  mkdir -p /www
RUN  chown -R www:www /var/lib/nginx
RUN  chown -R www:www /www
RUN  chown -R www:www /usr/share/nginx/html/ 
COPY index.html /usr/share/nginx/html/index.html
COPY default.conf /etc/nginx/conf.d/default.conf


# chown -R www:www /usr/share/nginx/html/
#COPY nginx.conf /etc/nginx/
#COPY index.html /www/
#COPY index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
