#!/bin/sh
read -p "Install with ufw or firewall (y|n)? " choice
read -p "create username for DB admin (admin) : " usr

# https://stackoverflow.com/questions/22249029/how-to-safely-confirm-a-password-by-entering-it-twice-in-a-bash-script/22249163
while true; do
    read -s -p "Password: " password
    echo
    read -s -p "Password (again): " password2
    echo
    [ "$password" = "$password2" ] && break
    echo "Please try again"
done

sudo apt update
yes | sudo apt install apache2
if [ $choice == "y" ]
then
  sudo apt install ufw
  sudo ufw allow ssh
  sudo ufw allow in "WWW Full"
  yes | sudo ufw enable
fi
yes | sudo apt install mariadb-server
printf '\nn\ny\n' | sudo mysql_secure_installation

if [[ -z "$usr" ]]
then
  usr="admin"
fi
printf "GRANT ALL ON *.* TO '$usr'@'localhost' IDENTIFIED BY '$password' WITH GRANT OPTION;\n" | sudo mariadb
printf "FLUSH PRIVILEGES;\n" | sudo mariadb

yes | sudo apt install php libapache2-mod-php php-mysql php-cli
rm /etc/apache2/mods-enabled/dir.conf
printf '<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>' > /etc/apache2/mods-enabled/dir.conf
sudo systemctl restart apache2
rm lamp-deb9.sh
