
function check_name
{
	if [[ $1 == --name=* ]] ; then
		NAME=`sed -e "s/^\-\-name\=//" <<< $1`
		return 0
	fi

	if [[ $1 == -n=* ]] ; then
		NAME=`sed -e "s/^\-n\=//" <<< $1`
		return 0
	fi

	return 1 # not found
}

function check_server_url
{
	if [[ $1 == --server-url=* ]] ; then
		SERVER_URL=`sed -e "s/^\-\-server\-url\=//" <<< $1`
		return 0
	fi

	if [[ $1 == -su=* ]] ; then
		SERVER_URL=`sed -e "s/^\-su\=//" <<< $1`
		return 0
	fi

	return 1 # not found
}

function check_agent_name
{
	if [[ $1 == --agent-name=* ]] ; then
		AGENT=`sed -e "s/^\-\-agent\-name\=//" <<< $1`
		return 0
	fi

	if [[ $1 == -an=* ]] ; then
		AGENT=`sed -e "s/^\-an\=//" <<< $1`
		return 0
	fi

	return 1 # not found
}

function check_agent_port
{
	if [[ $1 == --agent-port=* ]] ; then
		AGENT_PORT=`sed -e "s/^\-\-agent\-port\=//" <<< $1`
		return 0
	fi

	if [[ $1 == -ap=* ]] ; then
		AGENT_PORT=`sed -e "s/^\-ap\=//" <<< $1`
		return 0
	fi

	return 1 # not found
}

function check_agent_url
{
	if [[ $1 == --agent-url=* ]] ; then
		AGENT_URL=`sed -e "s/^\-\-agent\-url\=//" <<< $1`
		return 0
	fi

	if [[ $1 == -au=* ]] ; then
		AGENT_URL=`sed -e "s/^\-au\=//" <<< $1`
		return 0
	fi

	return 1 # not found
}

function check_server_name
{
	if [[ $1 == --server-name=* ]] ; then
		SERVER_NAME=`sed -e "s/^\-\-server\-name\=//" <<< $1`
		return 0
	fi

	if [[ $1 == -sn=* ]] ; then
		SERVER_NAME=`sed -e "s/^\-sn\=//" <<< $1`
		return 0
	fi

	return 1 # not found
}

function check_extension
{
	if [[ $1 == --extension=* ]] ; then
		EXTENSION=`sed -e "s/^\-\-extension\=//" <<< $1`
		EXTENSION=-$EXTENSION
		return 0
	fi

	if [[ $1 == -e=* ]] ; then
		EXTENSION=`sed -e "s/^\-e\=//" <<< $1`
		EXTENSION=-$EXTENSION
		return 0
	fi

	return 1 # not found
}

function unknown_parameter
{
	echo
	echo "Unknown parameter \"$1\""
	output_usage
	exit 1;
}

