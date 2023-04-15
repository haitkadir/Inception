#!/bin/bash

RUN useradd -ms /bin/bash myuser
RUN echo "$FTP_USER:$FTP_PASS" | chpasswd

echo "write_enable=YES" >> /etc/vsftpd.conf 
echo "local_umask=022" >> /etc/vsftpd.conf 
echo "chroot_local_user=YES" >> /etc/vsftpd.conf 
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf 
echo "pasv_enable=YES" >> /etc/vsftpd.conf 
echo "pasv_min_port=1024" >> /etc/vsftpd.conf 
echo "pasv_max_port=1048" >> /etc/vsftpd.conf 
echo "pasv_address=0.0.0.0" >> /etc/vsftpd.conf 
mkdir -p /var/run/vsftpd/empty # Default directory

mkdir /home/$FTP_USER/ftp 
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
chmod 755 /home/$FTP_USER/ftp


# Create directory for FTP server's files
RUN mkdir -p /var/ftp

exec "$@"