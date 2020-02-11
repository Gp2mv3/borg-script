#!/bin/bash

##################
# Configurations #
##################

# IP of your NAS
REMOTE_IP=mygoflex.local

# User of the NAS
REMOTE_USER=gp2mv3

# Remote directory (destination of the backup)
REMOTE_FOLDER=/data/backup/borg

# Directory to backup
LOCAL_DIR=/home/$REMOTE_USER

# Backup name (Default is HOSTNAME-YYY-MM-DD)
BCK_NAME=$(hostname)-$(date +%F)

# Passphrase of the backup
export BORG_PASSPHRASE='YOURPASSPHRASE'


###################
# Start of backup #
###################

# Check that the NAS is connected with a ping
ping -c 1 $REMOTE_IP
if [[ $? == 0 ]]
then
	# Send notification in tray
	notify-send "Backup started"

	# Backup folder using BORG
	borg create --exclude-from ./backup-exclude-borg.lst --stats $REMOTE_USER@$REMOTE_IP:$REMOTE_FOLDER::$BCK_NAME $LOCAL_DIR

	# Clean old backups (if needed)
	# borg prune $REMOTE_USER@$REMOTE_IP:$REMOTE_FOLDER::$BCK_NAME --keep-daily=14 --keep-monthly=6

	# Notify of the end
	notify-send "Backup ended !"
else
	notify-send "NAS not found"
fi
