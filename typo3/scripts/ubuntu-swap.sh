#!/usr/bin/env bash

########################################################################################################################
##                                      Vagrant Swap BASH Script                                                      ##
########################################################################################################################

# Swap size in MB
swapsize=512

# Does the swap file already exist?
grep -q "swapfile" /etc/fstab

# If not then create it
if [ $? -ne 0 ]; then
  echo 'swapfile not found. Adding swapfile.'
  fallocate -l ${swapsize}M /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
else
  echo 'swapfile found. No changes made.'
fi
