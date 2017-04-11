#! /usr/bin/env bash
SERVER_NAME=${1:-'default'}
DEFAULT_DOCUMENT_ROOT=${2:-'/var/www/html'}

########################################################################################################################
##                                      Vagrant Apache2 BASH Script                                              ##
########################################################################################################################

echo -e "\n--- Installing apache2 packages and configure Webserver ---\n"
apt-get -y install apache2 libapache2-mod-php5 >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Enabling mod-rewrite ---\n"
a2enmod rewrite >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Allowing Apache override to all ---\n"
sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

cat > /etc/apache2/sites-available/$SERVER_NAME.conf <<EOF
<VirtualHost *:80>
    ServerName $SERVER_NAME
    DocumentRoot $DEFAULT_DOCUMENT_ROOT
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
 </VirtualHost>
EOF

echo -e "\n--- Disable the default site defined in 000-default.conf ---\n"
a2dissite 000-default.conf >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Enable the new Virtual Host File ---\n"
a2ensite $SERVER_NAME.conf >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Restarting Apache ---\n"
service apache2 restart >> /vagrant/logs/vm_build.log 2>&1
