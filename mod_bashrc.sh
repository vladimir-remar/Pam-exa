#! /bin/bash
# Vladi
# Automatitzacio de tasques
sed -i -r 's/(^# User.*)/\1\necho 172.17.0.2 ldapserver>>\/etc\/hosts\n\/opt\/docker\/startup.sh/' /root/.bashrc
