FROM java:8

EXPOSE 8099

COPY build/libs/voter-service-0.2.0.jar /opt/

COPY libs/elastic-apm-agent-1.9.0.jar /opt/

COPY docker-init.sh /opt/

CMD /opt/docker-init.sh 
