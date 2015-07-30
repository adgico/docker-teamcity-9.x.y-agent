#!/bin/bash

docker rmi adgico/teamcity-9.1-agent
docker build -t adgico/teamcity-9.1-agent .

