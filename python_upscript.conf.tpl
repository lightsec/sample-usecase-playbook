console output
description "Python script on Upstart"
author  "Aitor Gomez-Goiri <aitor.gomez@deusto.es>"

setuid [[execuser]]

# http://askubuntu.com/questions/47649/does-upstart-emit-hooks-for-sysv-jobs
start on runlevel [2345]
stop on runlevel [016]

chdir /home/[[execuser]]/

exec [[command]]