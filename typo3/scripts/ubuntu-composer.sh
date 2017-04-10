#! /usr/bin/env bash


########################################################################################################################
##                                      Vagrant Composer BASH Script                                              ##
########################################################################################################################
echo -e "\n--- Installing Composer-specific packages ---\n"
apt-get -y install curl php5-cli git > /dev/null 2>&1

echo -e "\n--- Download and install Composer (system-wide) ---\n"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
