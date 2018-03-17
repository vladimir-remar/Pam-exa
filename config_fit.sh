#! /bin/bash
# Vladimir
# Script de proposito unico
# Modificacio de fitxers per la validacio via ldap
sed -i -e 's/^uid.*/uid nslcd/; 
         s/^gid.*/gid ldap/;
         s/^uri.*/uri ldap:\/\/ldapserver\//;
         s/^base.*/base dc=edt,dc=org/' /etc/nslcd.conf
sed -i -e 's/^passwd:.*/passwd:    files ldap/; 
        s/^shadow:.*/shadow:    files ldap/; 
        s/^group:.*/group:     files ldap/' /etc/nsswitch.conf
echo -e "BASE dc=edt,dc=org  \nURI ldap://ldapserver/" >>/etc/openldap/ldap.conf
authconfig --enableldap --enableshadow --enableldapauth --enablelocauthorize --ldapserver=ldap://ldapserver/ --ldapbasedn=dc=edt,dc=org --updateall &>/dev/null
sed -i -r 's/(^auth).*.(sufficient).*.(pam_ldap.so.*)/\1  optional \3\nauth sufficient pam_mount.so/; 
	s/(^-session.*.)/\1\nsession     optional      pam_mkhomedir.so skel=\/etc\/skel umask=0066/;
	s/(^session.*.pam_ldap.so)/\1\nsession optional pam_mount.so/' /etc/pam.d/system-auth-ac
sed -i -r 's/(<.*.Volume definitions.*.)/\1\n\t\t<volume user="*" fstype="tmpfs"  mountpoint="~\/tmp\/" options="size=100M,uid=%(USER),mode=0700" \/>/' /etc/security/pam_mount.conf.xml
