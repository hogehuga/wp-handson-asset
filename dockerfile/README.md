# modified wordpresss dockerfile.

This dokcer file add to wordpress docker image to
- wpscan
- nmap
- sshd setting (without daemon up)
  - port:22
- adduser
  - user1 - user5 , passwd
  - with sodo setting.


# usage

- move into dockerfile directory
  - `cd dockerfile/modwp`
- build docker image
  - `docker build -t modwpweb .`
  - wait a minutes.
- build complete. check images.
  - `docker images` -> contain "modwpweb"
- start container
  - use dockerconpose/handson/ docker compose project.
