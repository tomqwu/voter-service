#!/bin/bash

if [ "${ENABLE_ELASTIC_APM_AGENT}" = true ]; then
        java -javaagent:/opt/elastic-apm-agent-1.9.0.jar \
                -Delastic.apm.service_name=apm-agent-test-voter-service \
                -Delastic.apm.application_packages=org.example,com.example \
                -Delastic.apm.server_urls=${ELASTIC_APM_SERVER_URLS} \
                -jar /opt/voter-service-0.2.0.jar \
                --spring.profiles.active=${SPRING_PROFILE:-docker-production} \
                --spring.data.mongodb.host=${MONGODB_HOST:-mongodb}
else
        java -jar /opt/voter-service-0.2.0.jar \
                --spring.profiles.active=${SPRING_PROFILE:-docker-production} \
                --spring.data.mongodb.host=${MONGODB_HOST:-mongodb} 
fi
