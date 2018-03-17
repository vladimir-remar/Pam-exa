#! /bin/bash
# Vladi
# inici de serveis
/usr/sbin/nslcd
/usr/sbin/nscd &>/dev/null
