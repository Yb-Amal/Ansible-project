#!/bin/bash
ansible ws -m command -a 'sudo yum update -y'
ansible ws -m command -a 'sudo yum install git -y'
ansible all -m command -a 'uptime'