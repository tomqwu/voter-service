#!/bin/bash

java -jar /opt/voter-service-0.2.0.jar \
	--spring.profiles.active=${SPRING_PROFILE:-docker-production} \
        --spring.data.mongodb.host=${MONGODB_HOST:-mongodb} 

