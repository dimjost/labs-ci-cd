#!/bin/bash

echo "List existing Projects"
oc get projects

echo "Delete Projects"
oc delete project labs-ci-cd
oc delete project labs-dev
oc delete project labs-test

echo "Wait for 3 minutes"
sleep 180

echo "Install the required"
ansible-galaxy install -r requirements.yml --roles-path=roles

echo "Setup Projects"
ansible-playbook site.yml