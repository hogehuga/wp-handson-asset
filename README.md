# wordpress vuln-handson

- README.md
  - This file.
- dockercompose/
  - handson/
    - dockercompose file for handson.
    - use after build to dockerfile/ Dockerfile 
- dockerfile/
  - modified wordpress docker image.
    - add nmap, wpscan, wpcli(as wp), user(user1-user5:passwd), openssh(without daemon start)
- memo
  - wpweb-setting.sh
    - memo.

# hot2use

1. install docker, dockercompose
2. clone this repo.
  - `$ git clone https://github.com/hogehuga/hansonsetting.git`
3. build doker image to local for wordpress web service
  - `$ cd dockerfile`
  - `$ docker build -t modwpweb .`
  - check build completely
    - `$ docker images`
4. start the container
  - `$ cd dockercompose/handson`
  - `$ docker-compose up -d`
5. start sshd on wpweb
  - login to wordpress webserver by docker exec
    - `$ docker exec -it `handson_web1_1 /bin/bash
  - exec sshd daemon
    - `# /usr/sbin/sshd -D &`
    - `# exit`
  - Repeat for other handson_webN-N servers.
6. ssh to server from docker host server
  - `$ ssh user1@localhost -p 8021`

# wordpress settings

1. Web browser access to  http://localhost:8081 (-8085)
2. setting wordpress
  - select language.
  - neccesary information
    - title: handson-A (-E)
    - user: wordpress
    - passwd: wordpress
      - and allow weak password
      - because passwd crack later.
    - mail: a@b.local
    - do not index: yes
3. install vulnble plugin
  - select "plugin""add new""upload plugin"
  - upload  and install `plugin/social-warfare.3.5.0.zip` file.

# memo

```
…or create a new repository on the command line
---
echo "# wp-handson-asset" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/hogehuga/wp-handson-asset.git
git push -u origin master
```
