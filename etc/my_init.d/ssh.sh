#!/bin/bash

if [ "$DEBUG" == "1" ]; then
  rm -f /etc/service/sshd/down
  #ssh-keygen -P "" -t dsa -f /etc/ssh/ssh_host_dsa_key
fi
