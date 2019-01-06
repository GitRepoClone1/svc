#!/usr/bin/env bash

kubectl --namespace kube-system create sa tiller
# create a cluster role binding for tiller
kubectl create clusterrolebinding tiller \
    --clusterrole cluster-admin \
    --serviceaccount=kube-system:tiller

echo "initialize helm"
# initialized helm within the tiller service account
helm init --service-account tiller --wait

echo "Waiting for tiller pods to become ready..."
until helm version; do sleep 1; done

echo "verify helm"
# verify that helm is installed in the cluster
kubectl get deploy,svc tiller-deploy -n kube-system

# install jenkins chart
helm install -f ./consul/values.yaml consul -n consul