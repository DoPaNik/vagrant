#! /usr/bin/env bash
LOCALE=${1:-'de_DE.UTF-8'}
TIMEZONE=${2:-'Europe/Berlin'}
########################################################################################################################
##                                      Vagrant Localization BASH Script                                              ##
########################################################################################################################

echo -e "\n--- Set Timezone to $TIMEZONE ---\n"
timedatectl set-timezone $TIMEZONE >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Generate and set Locale de_DE.UTF-8 ---\n"
locale-gen $LOCALE >> /vagrant/logs/vm_build.log 2>&1
update-locale LANG=$LOCALE >> /vagrant/logs/vm_build.log 2>&1
