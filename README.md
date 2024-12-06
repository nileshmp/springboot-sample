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

## Deployment

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

## Creating Nginx using HELM
- execute all the 3 commands under dev_ops directory Terraform init/plan/apply
- aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
- helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

- kubectl get service --namespace ingress-nginx ingress-nginx-controller
- take the output endpoint from the above command output and add this under values.yaml (ingress section)
    ``` yaml
      ingress:
        enabled: true
        className: "nginx"
        annotations: {}
          # kubernetes.io/ingress.class: nginx
          # kubernetes.io/tls-acme: "true"
        hosts:
          - host: a60d8ba1948ab448db4eded516be8cac-225915466.ap-south-1.elb.amazonaws.com
            paths:
              - path: /
                pathType: ImplementationSpecific
        tls: []
        #  - secretName: chart-example-tls
        #    hosts:
        #      - chart-example.local
    ```
  
### Deploying static content on nginx
- 