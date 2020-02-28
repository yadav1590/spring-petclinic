#!/bin/bash

# Install kubernetes and set config
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

if [ $TRAVIS_BRANCH = "master" ];
then
  mkdir ${HOME}/.kube
  cp deployment/kube-config.yml ${HOME}/.kube/config

  # Fill out missing params in kubectl config file
  kubectl config set clusters.k8s-demo.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
  kubectl config set users.clusterUser_k8s-demo_k8s-demo.client-certificate-data "$KUBE_CLIENT_CERTIFICATE"
  kubectl config set users.clusterUser_k8s-demo_k8s-demo.client-key-data "$KUBE_CLIENT_KEY"
  #update the image
  kubectl set image deployment/petclinic petclinic=hrazaf6/spring-petclinic:$TRAVIS_COMMIT
fi