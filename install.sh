#!/usr/bin/env bash

# download gcp json credential file
gsutil cp gs://my-gcp-keys/devops.json ./consul-svc

# activate servoice account
gcloud auth activate-service-account --key-file ./consul-svc/devops.json

# download gke credentials 
gcloud container clusters get-credentials devops --zone us-east1-b --project devops-12232018

# install jenkins chart
helm install --name consul ./consul-svc/consul