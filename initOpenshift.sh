#!/bin/bash

echo "Remove old scripts"
rm -R -I roles

echo "Login to the local Openshift"
oc login https://127.0.0.1:8443 -u system

echo "List existing Projects"
oc get projects

echo "Delete Projects"
oc delete project labs-ci-cd
oc delete project labs-dev
oc delete project labs-test

echo "Wait for 1 minutes"
sleep 60

echo "Install the required"
ansible-galaxy install -r requirements.yml --roles-path=roles

echo "Setup Projects"
ansible-playbook site.yml