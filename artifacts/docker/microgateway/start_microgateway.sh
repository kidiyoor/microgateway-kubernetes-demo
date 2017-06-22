#!/usr/bin/env bash

# TODO: check if all ENV is set
# TODO: check if secrets is attached by checking /opt/apigee/microgateway/cred/cred.txt if exists
# TODO: check if configmap is attached by checking /root/.edgemicro/configmap/default.yaml if exists

# Setting ENV variables passed in secrets
source /opt/apigee/microgateway/cred/cred.txt

# copy default config from configmap volume
cp /root/.edgemicro/configmap/default.yaml /root/.edgemicro/default.yaml

# Configure microgateway
edgemicro configure --debug -o $EDGEMICRO_ORG -e $EDGEMICRO_ENV -u $EDGEMICRO_USERNAME -p $EDGEMICRO_PASSWORD 2>&1  | tee /tmp/edge_microgateway_configure.txt

edge_key=$(cat /tmp/edge_microgateway_configure.txt | grep key | awk '{ print $2 }')
edge_secret=$(cat /tmp/edge_microgateway_configure.txt | grep secret | awk '{ print $2 }')

rm /tmp/edge_microgateway_configure.txt

export EDGEMICRO_KEY=$edge_key
export EDGEMICRO_SECRET=$edge_secret

# Run microgateway
edgemicro start -o $EDGEMICRO_ORG -e $EDGEMICRO_ENV -k $EDGEMICRO_KEY -s $EDGEMICRO_SECRET 2>&1


