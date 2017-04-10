#! /usr/bin/env bash


########################################################################################################################
##                                      Vagrant Composer BASH Script                                              ##
########################################################################################################################
echo -e "\n--- Installing Composer-specific packages ---\n"
apt-get -y install curl php5-cli git >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Download and install Composer (system-wide) ---\n"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer >> /vagrant/logs/vm_build.log 2>&1

if [[ -s /vagrant/composer.lock ]] ;then
  rm -rf /vagrant/composer.lock
fi


if [[ -s /vagrant/composer.json ]] ;then
  cd /vagrant
  #TODO Integrate Configuration for Composer via yaml-File
  sudo -u vagrant composer install >> /vagrant/logs/vm_build.log 2>&1
fi
