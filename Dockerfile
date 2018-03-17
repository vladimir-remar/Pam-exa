# Version: 0.0.1
FROM docker.io/edtasixm06/exam2017

RUN dnf -y update vi
RUN dnf -y install vim procps iputils iproute man-db mlocate tree nmap 
RUN dnf -y install openldap-clients openldap-devel passwd pam_ldap pam_mount authconfig authconfig-gtk

COPY * /opt/docker/
WORKDIR /opt/docker/
RUN ./users.sh
RUN ./config_fit.sh
RUN ./mod_bashrc.sh
CMD ["/bin/bash"]
