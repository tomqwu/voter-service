FROM nginx

EXPOSE 443 80

COPY nginx.conf /etc/nginx/nginx.conf

COPY init.sh /opt/

ENTRYPOINT [ "/opt/init.sh" ]
