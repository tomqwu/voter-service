#!/bin/bash

java -Delastic.apm.server_urls=${ELASTIC_APM_SERVER_URLS} \
     -Delastic.apm.verify_server_cert=${ELASTIC_APM_VERIFY_SERVER_CERT} \
        -jar /opt/voter-service-0.2.0.jar \
        --spring.profiles.active=${SPRING_PROFILE:-docker-production} \
        --spring.data.mongodb.host=${MONGODB_HOST:-mongodb}
