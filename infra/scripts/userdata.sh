#!/bin/bash
yum update
yum install python3 -y
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
python3 -m pip install ansible
