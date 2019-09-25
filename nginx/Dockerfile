FROM nginx

EXPOSE 443 80

COPY nginx.conf /etc/nginx/nginx.conf

COPY init.sh /opt/init.sh

ENTRYPOINT [ "/opt/init.sh" ]
