#!/bin/bash

MY_PATH=`dirname $0`

source $MY_PATH/command-line.sh

function output_usage
{
	echo
	echo "Usage: create_local_teamcity_agent.sh <options>"
	echo
	echo "Options:"
	echo "--name, -n         Sets the container name"
	echo "--server-url, -su  Specifies the URL of the TeamCity server"
	echo "                   without the port (e.g. server)"
	echo "--agent-name, -an  Specifies the name of the agent"
	echo "--server-name, -sn Specifies the server container name"
	echo
}

for PARAMETER in $* ; do
	check_name "$PARAMETER" ||
	check_server_url "$PARAMETER" ||
	check_agent_name "$PARAMETER" ||
	check_server_name "$PARAMETER" ||
	check_extension "$PARAMETER" ||
	unknown_parameter "$PARAMETER"
done

if [ "$NAME" == "" ] ; then
	echo No name specified
	output_usage
	exit 1
fi

if [ "$SERVER_NAME" == "" ] ; then
	echo No server name specified
	output_usage
	exit 1
fi

if [ "$SERVER_URL" == "" ] ; then
	SERVER_URL=$SERVER_NAME
fi

if [ "$AGENT" == "" ] ; then
	AGENT=$NAME
fi

ENV="$ENV -e SERVER_URL=$SERVER_URL:8111 -e AGENT=$AGENT"

docker run --name=$NAME -d --link=$SERVER_NAME $ENV adgico/teamcity-9.x.y-agent$EXTENSION
