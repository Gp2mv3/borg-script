#!/bin/bash

##################
# Configurations #
##################

# IP of your NAS
IP=mygoflex.local

# User of the NAS
USER=gp2mv3

# Remote directory (destination of the backup)
REMOTE_FOLDER=/data/backup/borg

# Directory to backup
LOCAL_DIR=/home/$USER

# Backup name (Default is HOSTNAME-YYY-MM-DD)
BCK_NAME=$(hostname)-$(date +%F)

# Passphrase of the backup
export BORG_PASSPHRASE='YOURPASSPHRASE'

# Title of notification displayed
NOTIF_TITLE='Borg backup'




###################
# Start of backup #
###################

# Check that the NAS is connected with a ping
ping -c 1 $IP
if [[ $? == 0 ]]
then
	# Send notification in tray
	notify-send $NOTIF_TITLE "Backup started"

	# Backup folder using BORG
	borg create --exclude-from ./backup-exclude-borg.lst --stats $USER@$IP:$REMOTE_FOLDER::$BCK_NAME $LOCAL_DIR

	# Clean old backups (if needed)
	# borg prune $USER@$IP:$REMOTE_FOLDER::$BCK_NAME --keep-daily=14 --keep-monthly=6

	# Notify of the end
	notify-send $NOTIF_TITLE  "Backup ended !"
else
	notify-send $NOTIF_TITLE "NAS not found"
fi
