SaltMaster with Syndic
========

Container with salt master running inside with syndic and minion


Based on
======================
CentOS 7

How to use it
======================

``Docker compose``
-----------------

Modify docker-compose.yml
Run container with docker-compose up -d

``Docker run``
-----------------

Start container with:


docker run -d --restart=unless-stopped \
-e SALT_MINION_ID='SaltMaster' \
-e SALT_ENV='base' \
-e SALT_MASTER_PUBLISH='4505' \
-e SALT_MASTER_PORT='4506' \
-p 4506:4506 -p 4505:4505 \
-v /opt/salt/base-etc/certs:/etc/pki/tls/certs:ro \
-v /opt/salt/base-etc/pki:/etc/salt/pki:ro \
-v /opt/salt/base-etc/master.d:/etc/salt/master.d \
-v /opt/salt/base:/opt/salt/base \
--name saltmaster smonko/salt-master


Maintainer
======================
Stefan Monko, monkostefan@gmail.com
