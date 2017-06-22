Kubernetes version of apigee microgateway 

Can be run in other platforms too by attaching volume mount for 

1) /opt/apigee/microgateway/cred

containing cred.txt

EDGEMICRO_USERNAME=gauthamvk@google.com

EDGEMICRO_PASSWORD=********

EDGEMICRO_ORG=bumblebee

EDGEMICRO_ENV=test


2)/root/.edgemicro/configmap

containing default.yaml file of apigee microgateway
