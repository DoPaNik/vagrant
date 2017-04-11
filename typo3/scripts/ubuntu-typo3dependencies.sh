#! /usr/bin/env bash
DEFAULT_DOCUMENT_ROOT=${1:-'/var/www/html'}
########################################################################################################################
##                                      Vagrant TYPO3 Dependencies BASH Script                                        ##
########################################################################################################################

echo -e "\n--- Install ImageMagick ---\n"
apt-get -y install imagemagick >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Adjust some PHP variables for TYPO3 ---\n"
cp /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.orig
sed -i 's/max_execution_time = 30/max_execution_time = 240/' /etc/php5/apache2/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 10M/' /etc/php5/apache2/php.ini
sed -i 's/post_max_size = 8M/post_max_size = 10M/' /etc/php5/apache2/php.ini
sed -i 's/; max_input_vars = 1000/max_input_vars = 1500/' /etc/php5/apache2/php.ini

echo -e "\n--- Restarting Apache ---\n"
service apache2 restart >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Create the FIRST_INSTALL File ---\n"
touch $DEFAULT_DOCUMENT_ROOT/FIRST_INSTALL
