#!/bin/bash

endpoint=$1

for name in simulation candidates votes results results/votes winners winners/votes info health metrics
do
	curl -kv $endpoint/$name
done 
