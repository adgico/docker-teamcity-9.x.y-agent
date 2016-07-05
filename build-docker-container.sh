#!/bin/bash

docker rmi adgico/teamcity-9.x.y-agent
docker build -t adgico/teamcity-9.x.y-agent .
