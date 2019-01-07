#!/usr/bin/env bash

gcloud auth activate-service-account --key-file ./consul-svc/devops.json

gcloud container clusters get-credentials jenkins --zone us-east1-b --project devops-12232018

# install jenkins chart
helm install --name consul ./consul-svc/consul