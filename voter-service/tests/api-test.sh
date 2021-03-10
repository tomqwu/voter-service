#!/bin/bash

endpoint=$1

for name in simulation candidates votes results results/votes winners winner/votes info health metrics actuator mappings env configprops 
do
    curl $endpoint/$name
done