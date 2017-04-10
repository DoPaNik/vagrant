#! /usr/bin/env bash
DEFAULT_DOCUMENT_ROOT=$1
DBPASSWD=$2

########################################################################################################################
##                                      Vagrant phpMyAdmin BASH Script                                              ##
########################################################################################################################
echo -e "\n--- Installing PHP-specific packages ---\n"
apt-get -y install php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql php-apc >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Install and configure phpMyAdmin ---\n"
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
apt-get -y install phpmyadmin >> /vagrant/logs/vm_build.log 2>&1

cat > /etc/apache2/conf-available/phpmyadmin.conf <<EOF
      <Directory /usr/share/phpmyadmin>
        Options FollowSymLinks
        DirectoryIndex index.php
        AllowOverride All
      </Directory>
EOF

echo -e "\n--- Enable the phpMyAdmin Conf ---\n"
a2enconf phpmyadmin >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Set symbolic Link to DocumentRoot ---\n"
rm -rf $DEFAULT_DOCUMENT_ROOT/phpmyadmin
ln -s /usr/share/phpmyadmin $DEFAULT_DOCUMENT_ROOT

echo -e "\n--- Enable Mod mcrypt ---\n"
php5enmod mcrypt >> /vagrant/logs/vm_build.log 2>&1

echo -e "\n--- Restarting Apache ---\n"
service apache2 restart >> /vagrant/logs/vm_build.log 2>&1




#type mysql-server >/dev/null 2>&1 && echo configure_phpMyAdmin || echo "MySQL-Server not present."
