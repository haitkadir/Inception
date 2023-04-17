#!/bin/bash
if ! id -u $FTP_USER >/dev/null 2>&1; then
    useradd -m -s /bin/bash $FTP_USER
fi
echo "$FTP_USER:$FTP_PASS" | chpasswd

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
sed -i "s/FTP_USER/$FTP_USER/g" /etc/vsftpd.conf
mkdir -p /var/run/vsftpd/empty # Default directory

mkdir -p /home/$FTP_USER/ftp/
chown -R nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp
mkdir -p /home/$FTP_USER/ftp/files
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

exec "$@"
