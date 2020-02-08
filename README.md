# securenomad/libpam-mysql-docker

Base image used that installs and configures libpam-mysql to enable MySQL based PAM authentication.

This image uses [phusion/baseimage](https://github.com/phusion/baseimage-docker) as a base. Please see their docs for information on how startup and runtime scripts are used.

## How to use

Set as `FROM securenomad/libpam-mysql` in your Dockerfile and set the ENV vars mentioned below.

## ENV Variables

### MySQL Credentials

On init, `update_config.sh` will run and use the following env variables to update `/etc/vpnservice-pam.conf`. The username and password are also stored in `creds.conf` for `openvpn-db-log.pl`

```
MYSQL_HOST
MYSQL_USER
MYSQL_PASSWORD
MYSQL_DATABASE
```

### Readiness Probe

A username and password will be verified against the MySQL database. If the service can not connect to the database, or for some reason the username/password combo does not return a user, the probe fails.

```
TEST_USERNAME
TEST_PASSWORD
```

### Debugging

Set `DEBUG` to 1\. This will enable ssh and some more verbose logging on startup scripts. You can set the docker build time variable (`ARG`) SSH_IMPORT_ID to provide a user to [ssh-import-id](http://manpages.ubuntu.com/manpages/bionic/man1/ssh-import-id.1.html)
