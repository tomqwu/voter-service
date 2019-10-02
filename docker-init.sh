#!/bin/bash

if [ ${ENABLE_ELASTIC_JAVAAGENT} = "true" ];
then
        java -javaagent:/opt/elastic-apm-agent-1.9.0.jar
                -jar /opt/voter-service-0.2.0.jar \
                --spring.profiles.active=${SPRING_PROFILE:-docker-production} \
                --spring.data.mongodb.host=${MONGODB_HOST:-mongodb}

else
        java -jar /opt/voter-service-0.2.0.jar \
                --spring.profiles.active=${SPRING_PROFILE:-docker-production} \
                --spring.data.mongodb.host=${MONGODB_HOST:-mongodb}

fi
