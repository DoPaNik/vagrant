#! /usr/bin/env bash

########################################################################################################################
##                                      Vagrant Localization BASH Script                                              ##
########################################################################################################################

echo -e "\n--- Set Timezone to Europe/Berlin ---\n"
timedatectl set-timezone Europe/Berlin >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Generate and set Locale de_DE.UTF-8 ---\n"
locale-gen de_DE.UTF-8 >> /vagrant/logs/vm_build.log 2>&1
update-locale LANG=de_DE.UTF-8 >> /vagrant/logs/vm_build.log 2>&1
