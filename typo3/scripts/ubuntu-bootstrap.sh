#! /usr/bin/env bash

########################################################################################################################
##                                      Vagrant Bootstrap BASH Script                                                 ##
########################################################################################################################

cat <<"EOF"
 _______   ______   ___ _____   _____            _                                      _
|_   _\ \ / /  _ \ / _ \___ /  | ____|_ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
  | |  \ V /| |_) | | | ||_ \  |  _| | '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
  | |   | | |  __/| |_| |__) | | |___| | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
  |_|   |_| |_|    \___/____/  |_____|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|
EOF

echo -e "\n--- Preconfigure Environment ---\n"
mkdir -p /vagrant/logs
echo "Start Initialisation of VM" > /vagrant/logs/vm_build.log
sudo rm --recursive --dir --force /vagrant/cms/**

echo -e "\n--- Updating packages list ---\n"
apt-get -qq update

echo -e "\n--- Install base packages ---\n"
apt-get -y install vim curl build-essential python-software-properties landscape-common git >> /vagrant/logs/vm_build.log 2>&1
