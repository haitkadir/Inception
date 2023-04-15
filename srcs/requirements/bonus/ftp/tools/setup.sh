#!/bin/bash

useradd -ms /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

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
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
chmod 755 /home/$FTP_USER/ftp


exec "$@"