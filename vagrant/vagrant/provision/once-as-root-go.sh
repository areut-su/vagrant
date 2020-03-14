#!/usr/bin/env bash

GOSOURCE=https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz
GOTARGET=/usr/local
#GOPATH=\$HOME/go
GOPATH=/go_web
# cd  ~/


# download Go tools to $GOTARGET/go
curl -sSL $GOSOURCE -o /tmp/go.tar.gz
tar -xf /tmp/go.tar.gz -C $GOTARGET
rm /tmp/go.tar.gz

DATE=`date "+%F_%T"`

function print_profile_go {
# apply environment configuration to the user's .profile
printf "\n" >> $PROFILE
printf "# golang configuration start $DATE\n" >> $PROFILE
printf "export GOROOT=$GOTARGET/go\n" >> $PROFILE
printf "export GOPATH=$GOPATH\n" >> $PROFILE
printf "export PATH=\$PATH:$GOTARGET/go/bin:$GOPATH/bin\n" >> $PROFILE
printf "# golang configuration END $DATE\n" >> $PROFILE
}
PROFILE=/home/vagrant/.profile
$(print_profile_go)
#PROFILE=/root/.profile
PROFILE=/root/.bashrc
$(print_profile_go)