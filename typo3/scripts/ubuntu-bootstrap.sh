#! /usr/bin/env bash

########################################################################################################################
##                                      Vagrant Bootstrap BASH Shell Script                                           ##
########################################################################################################################

cat <<"EOF"
 _______   ______   ___ _____   _____            _                                      _
|_   _\ \ / /  _ \ / _ \___ /  | ____|_ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
  | |  \ V /| |_) | | | ||_ \  |  _| | '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
  | |   | | |  __/| |_| |__) | | |___| | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
  |_|   |_| |_|    \___/____/  |_____|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|
EOF

echo -e "\n--- TYPO3 Environment installing now... Mkay?! ---\n"

echo -e "\n--- Updating packages list ---\n"
apt-get -qq update

######################
##  Install System  ##
######################

echo -e "\n--- Install base packages ---\n"
apt-get -y install vim curl build-essential python-software-properties git > /dev/null 2>&1

echo -e "\n--- Development Environment ready  ---\n"
