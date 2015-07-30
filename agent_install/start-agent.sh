#!/bin/bash

MY_DIR=`dirname $0`
cd $MY_DIR

PROPERTIES_FILE=/TeamCity/buildAgent/conf/buildAgent.properties
BASE_PROPERTIES_FILE=/TeamCity/buildAgent/conf/base.buildAgent.properties

if [ "$SERVER_URL" == "" ] ; then
	SERVER_URL=localhost:80
fi

if [ "$AGENT" == "" ] ; then
	AGENT="Unknown Agent"
fi

if [ "$OWN_PORT" == "" ] ; then
	OWN_PORT=9090
fi

if [ "$OWN_URL" != "" ] ; then
	OWN_URL_REPLACE=";s/#ownAddress=OWN_URL/ownAddress=$OWN_URL/"
fi

if [ ! -e $PROPERTIES_FILE ] ; then
	echo Creating configuration file
	sed -e "s/SERVER_URL/$SERVER_URL/;s/AGENT/$AGENT/;s/OWN_PORT/$OWN_PORT/$OWN_URL_REPLACE" $BASE_PROPERTIES_FILE > $PROPERTIES_FILE
fi

if [ -e /TeamCity/buildAgent/bin/agent.sh ] ; then
	cd /TeamCity/buildAgent/bin
	./agent.sh run
fi
