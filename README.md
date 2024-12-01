# README #
Readme file for the sample springboot project, for jenkins integration.

### What is this repository for? ###


* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

## Deployement

### Creating eks cluster with eksctl tool (instead of terraform)
eksctl create cluster \
  --name springboot-cluster \
  --region ap-south-1 \
  --nodes 2 \
  --nodes-min 2 \
  --nodes-max 2 \
  --node-type a1.medium

aws eks --region ap-south-1 update-kubeconfig --name springboot-cluster

helm create springboot-app

helm install springboot-release ./springboot-app

kubectl scale deployment springboot-release --replicas=2

helm uninstall springboot-release
eksctl delete cluster --name springboot-cluster