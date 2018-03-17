#! /bin/bash
# Vladi
# Creacio cuentas de usuaris UNIX

l_users="
exam01
exam02
exam03
"
for user in $l_users
do
  useradd $user &>/dev/null
  echo $user | passwd $user --stdin &>/dev/null
done
exit 0
