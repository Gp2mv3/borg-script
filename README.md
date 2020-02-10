# Easy backup with Borg

Some days ago, I discovered **[Borg backup](https://www.borgbackup.org/)**, a super easy and efficient backup solution for Linux and Mac OS X.

I wanted to share my discovery on [my blog](https://gp2mv3.com/) so I created this repo with my scripts.

Don't hesitate to read the full blog post here: [Easy backups with Borg](https://gp2mv3.com/easy-backups-with-borg).

## Content of the Repo

### init-borg.sh

This file creates a new Borg repository (Encrypted) and exports the private key (Copy it in a safe place !).

### backup-borg.sh

This file is the backup script. It backups the selected folder without and exclude specific files and folders as specified in backup-exclude-borg.lst.

## Feedbacks and PRs welcome

Don't hesitate to give feedback (in PR or Issues) or even on [Twitter](https://twitter.com/gp2mv3).
