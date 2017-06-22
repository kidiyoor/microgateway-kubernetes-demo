#!/usr/bin/env bash

kubectl create -f ../artifacts/kube/services/microservice-helloworld.yaml
kubectl create -f ../artifacts/kube/pods/microservice-helloworld.yaml