# Script LAMP VPS
Automatically install LAMP (Linux, Apache2, MariaDB, PHP) for your fresh VPS

Available for 
1. Debian 9

Tested in 
1. Google Cloud
2. Azure
---

Set up
------
Login as root
```console
user@host:~$ sudo su
root@host:/home/user# 
```

Go to temp folder (Optional)
```console
root@host:/home/user# cd /tmp
root@host:/tmp#
```
Select that match ur OS
-----
For deb 9
```console
root@host:/tmp# wget https://raw.githubusercontent.com/taqyrrahman/script-lamp-vps/master/lamp-deb9.sh
. . .
root@host:/tmp# bash lamp-deb9.sh
1. Install with ufw (firewall)
2. Install without ufw (firewall)
choice : 1 (its up to you)
create username for DB admin (admin) : (default is 'admin' if blank)
Password: 
Password (again): 
. . .
root@host:/tmp#
```
Next Step
-----
For Debian 9
1. Install SSL (Lets encrypt) [here](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-debian-9)
2. Install PHPMyAdmin [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-debian-9)


Disclaimer
-----
Do with your own risk, im not responsible for any harm or error to ur stuffs

this automated installation based on tutorial at [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-debian-9)
