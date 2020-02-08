FROM phusion/baseimage:0.11
CMD ["/sbin/my_init"]
ARG SSH_IMPORT_ID

# base image:
# * pam configs
# * scripts to run on boot

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y build-essential libmysqlclient-dev mysql-client libpam-mysql \
        mlocate iputils-ping wget iptables python3-pip && \
    rm -rf /tmp/* /var/tmp/* /var/cache/distfiles/* /var/lib/apt/lists/*

RUN pip3 install requests
RUN pip3 install ssh-import-id

ADD etc/ /etc/
RUN chmod +x /etc/my_init.d/*

RUN rm -rf /tmp/* /var/tmp/* /var/cache/distfiles/* /var/lib/apt/lists/*

# SSH for debug and copy over dev pub key
EXPOSE 22
RUN chmod 700 /root/.ssh && chown root:root /root/.ssh
RUN test -z "$SSH_IMPORT_ID" || ssh-import-id $ssh_import_id && :
