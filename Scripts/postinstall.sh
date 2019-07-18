#!/bin/bash

#Set Kubectl cluster and Configure Config Map Auth AWS

pushd ./eks-getting-started
    terraform output kubeconfig > ~/.kube/config
    terraform output config_map_aws_auth > ../trash/config_map_aws_auth.yaml
popd

pushd ./trash
    kubectl apply -f config_map_aws_auth.yaml
popd
