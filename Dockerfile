FROM centos:7
MAINTAINER Stefan Monko, PosAm s.r.o.

# Arguments
ARG envToCreate=container

# Update OS
RUN yum update -y

# Install salt
RUN yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm && \
 yum install -y salt-master && \
 sed -i -e "/hash_type:/c\hash_type: sha256" /etc/salt/master && \
 yum clean all

RUN yum install -y salt-minion

ADD run_syndic.sh /root/run_master.sh
RUN chmod a+x /root/run_master.sh


CMD ["/root/run_master.sh"]
