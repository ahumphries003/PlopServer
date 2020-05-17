# PlopServer

Backup Script - Manual Run
'
rsync -a  -r --delete --progress -e  ssh /mnt/md0/docker/PlopServer administrator@192.168.1.21:/mnt/md0/Backup
'
