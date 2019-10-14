#!/bin/sh
apt-get update
apt-get install -y vim nmap openssh-server sudo
mkdir /var/run/sshd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

useradd -m -s /bin/bash user1; useradd -m -s /bin/bash user2; useradd -m -s /bin/bash user3; useradd -m -s /bin/bash user4; useradd -m -s /bin/bash user5;
echo 'user1:passwd' | chpasswd; echo 'user2:passwd' | chpasswd; echo 'user3:passwd' | chpasswd; echo 'user4:passwd' | chpasswd; echo 'user5:passwd' | chpasswd
echo 'user1  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user2  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user3  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user4  ALL=(ALL)      ALL' >> /etc/sudoers; echo 'user5  ALL=(ALL)  ALL' >> /etc/sudoers

/usr/sbin/sshd -D
