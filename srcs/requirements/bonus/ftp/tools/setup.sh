#!/bin/bash

useradd -ms /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

# echo "local_root=/home/$FTP_USER/ftp" >> /etc/vsftpd.conf
# echo "write_enable=YES" >> /etc/vsftpd.conf 
# echo "local_umask=022" >> /etc/vsftpd.conf 
# echo "chroot_local_user=YES" >> /etc/vsftpd.conf 
# echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 
# echo "pasv_enable=YES" >> /etc/vsftpd.conf 
# echo "pasv_min_port=1024" >> /etc/vsftpd.conf 
# echo "pasv_max_port=1048" >> /etc/vsftpd.conf 
# echo "pasv_address=0.0.0.0" >> /etc/vsftpd.conf 

mkdir -p /var/run/vsftpd/empty # Default directory

mkdir -p /home/$FTP_USER/ftp 
chown -R nobody:nogroup /home/$FTP_USER/ftp
# chmod 755 /home/$FTP_USER/ftp

# Sets the owner of the /home/ata/ftp directory to be nobody.
# sudo chown nobody:nogroup /home/ata/ftp
# Ensures that only the owner (your FTP user) 
# has write(w) access(a) to the /home/ata/ftp directory.
sudo chmod a-w /home/$FTP_USER/ftp


exec "$@"