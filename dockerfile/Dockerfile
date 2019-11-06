From wordpress:5.2.2

# install additional package
RUN apt-get update ; apt-get upgrade ; apt-get install -y apt-utils 
RUN apt-get install -y vim nmap ruby git openssh-server sudo openssh-server curl git libcurl4-openssl-dev make zlib1g-dev gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config ruby bundler ruby-dev

# setup sshd
RUN mkdir /var/run/sshd; echo 'root:screencast' | chpasswd; echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config; sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# add team user
RUN useradd -m -s /bin/bash user1; useradd -m -s /bin/bash user2; useradd -m -s /bin/bash user3; useradd -m -s /bin/bash user4; useradd -m -s /bin/bash user5;
RUN echo 'user1:passwd' | chpasswd; echo 'user2:passwd' | chpasswd; echo 'user3:passwd' | chpasswd; echo 'user4:passwd' | chpasswd; echo 'user5:passwd' | chpasswd
RUN echo 'user1  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user2  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user3  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user4  ALL=(ALL)  ALL' >> /etc/sudoers; echo 'user5  ALL=(ALL)  ALL' >> /etc/sudoers

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# install wpscan
RUN gem install wpscan

# install wpcli
run curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ; chmod +x wp-cli.phar ; mv wp-cli.phar /usr/local/bin/wp

# copy attack page
ADD othersite.tgz /var/www/html/
COPY vuln-demo.pdf /var/www/html/

