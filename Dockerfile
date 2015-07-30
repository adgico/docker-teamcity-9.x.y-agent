FROM       adgico/teamcity-9.1-server
MAINTAINER Byran Wills-Heath <byran@adgico.co.uk>

WORKDIR /
COPY agent_install/start-agent.sh /start-agent.sh
COPY agent_install/base.buildAgent.properties /TeamCity/buildAgent/conf/base.buildAgent.properties
RUN rm /TeamCity/buildAgent/conf/buildAgent.properties
ENV SERVER_URL="" AGENT="" OWN_PORT="" OWN_URL=""
CMD [ "/bin/sh", "-c", "/start-agent.sh" ]

