#!/bin/bash
set -e
yum install git -y
cd /root
git clone https://github.com/Naveen209/roboshop-shell.git
cd /root/roboshop-shell
sh mongodb.sh