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


#################
# Init the repo #
#################

# Generate a random passphrase (needed in the next step)
echo "An example of strong passphrase is generated:"
head /dev/urandom | tr -dc A-Za-z0-9 | head -c48

# Init the remote repo with a repokey and the blake2b hash function
borg init -e repokey-blake2 $USER@$IP:$REMOTE_FOLDER

# Exports the backup key (Store it in a safe place !)
borg key export $USER@$IP:$REMOTE_FOLDER ~/Borg-key-bck
