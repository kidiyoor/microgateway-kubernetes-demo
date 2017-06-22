FROM ubuntu:latest

## Requirement :
# ENV edge_username
# ENV edge_password
# ENV edge_org
# ENV edge_env

RUN apt-get -y update
RUN apt-get install -y wget curl
RUN apt-get install -y python-software-properties
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs

RUN mkdir -p /opt/apigee/microgateway
RUN npm install -g edgemicro

RUN edgemicro init
RUN mkdir -p /root/.edgemicro/configmap

ADD start_microgateway.sh /opt/apigee/microgateway/start_microgateway.sh

RUN chmod 755 /opt/apigee/microgateway/start_microgateway.sh

CMD ["/opt/apigee/microgateway/start_microgateway.sh"]

