#!/usr/bin/env bash

gcloud auth activate-service-account --key-file ./consul-svc/devops.json

gcloud container clusters get-credentials jenkins --zone us-east1-b --project devops-12232018

kubectl --namespace kube-system create sa tiller
# create a cluster role binding for tiller
kubectl create clusterrolebinding tiller \
    --clusterrole cluster-admin \
    --serviceaccount=kube-system:tiller

echo "initialize helm"
# initialized helm within the tiller service account
helm init --service-account tiller --wait

sleep 10

# install jenkins chart
helm install -f ./consul/values.yaml consul -n consul