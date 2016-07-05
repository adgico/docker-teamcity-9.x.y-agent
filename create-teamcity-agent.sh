#!/bin/bash

MY_PATH=`dirname $0`

source $MY_PATH/command-line.sh

function output_usage
{
	echo
	echo "Usage: create_teamcity_agent.sh <options>"
	echo
	echo "Options:"
	echo "--name, -n         Sets the container name"
	echo "--server-url, -su  Specifies the URL of the TeamCity server"
	echo "                   (e.g. www.example.com:8080)"
	echo "--agent-name, -an  Specifies the name of the agent"
	echo "--agent-port, -ap  Specifies the port that the TeamCity server"
	echo "                   will use to communicate with the build agent"
	echo "--agent-url, -au   Specifies the URL of the agent (without the port)"
	echo
}

for PARAMETER in $* ; do
	check_name "$PARAMETER" ||
	check_server_url "$PARAMETER" ||
	check_agent_name "$PARAMETER" ||
	check_agent_port "$PARAMETER" ||
	check_agent_url "$PARAMETER" ||
	check_extension "$PARAMETER" ||
	unknown_parameter "$PARAMETER"
done

if [ "$NAME" == "" ] ; then
	echo No name specified
	output_usage
	exit 1
fi

ENV=
if [ "$SERVER_URL" != "" ] ; then
	ENV="$ENV -e SERVER_URL=$SERVER_URL"
fi

if [ "$AGENT" != "" ] ; then
	ENV="$ENV -e AGENT=$AGENT"
fi

PORT_MAPPING=9090:9090
if [ "$AGENT_PORT" != "" ] ; then
	PORT_MAPPING=$AGENT_PORT:$AGENT_PORT
	ENV="$ENV -e OWN_PORT=$AGENT_PORT"
fi

if [ "$AGENT_URL" != "" ] ; then
	ENV="$ENV -e OWN_URL=$AGENT_URL"
fi

docker run --name=$NAME -p $PORT_MAPPING -d $ENV adgico/teamcity-9.x.y-agent$EXTENSION
