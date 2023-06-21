# Pyhton App Deploy





## Description
In this Project i implemented a DevOps workflow with the help of **Kubernetes**, **Docker**, **Ansible** and **Terraform**.

It uses Dockerfile to create docker image then pushed it to the dockerhub repository. 

With Terraform the kubernetes cluster is provisioned in azure cloud. 

Deployment is done with the help of Ansible and Kubernets Configuration files to run pods having containers on pods in kubernetes cluster.

To pull the image from dockerhub repo into kubernetes Deployment file i used the secret file which i created with the help of this resource

https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/



## Installation

Provision Kubernetes Cluster using Terraform on Azure Cloud
```bash
    cd Terraform
    Terraform init
    terraform apply --auto-approve
```
Deploy the app using Ansible Playbooks
```bash
    cd Ansible
    ansible-playbook deploy-playbook.yaml
```
