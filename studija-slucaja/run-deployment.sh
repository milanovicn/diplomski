#!/bin/bash

mode=$1

#installation of required roles
ansible-galaxy install -r requirements.yaml


if [ $mode = "all" ]
then
echo "Deploying all servers..."
echo "Deploying database servers..."
ansible-playbook -i Environments/inventory deploy_dbservers.yaml
echo "Deploying web servers..."
ansible-playbook -i Environments/inventory deploy_webservers.yaml
fi


if [ $mode = "dbservers" ]
then
echo "Deploying only database servers..."
#deployment of database servers
ansible-playbook -i Environments/inventory deploy_dbservers.yaml
fi


if [ $mode = "webservers" ]
then
echo "Deploying only web servers..."
#deployment of web servers
ansible-playbook -i Environments/inventory deploy_webservers.yaml
fi
