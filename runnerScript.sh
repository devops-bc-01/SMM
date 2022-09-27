#!/bin/sh
. /vagrant/runner-credentials/.env
DIR=actions-runner
FILE=actions-runner/actions-runner-linux-x64-2.296.2.tar.gz
SERVICE=actions-runner/svc.sh

if [ -d "$DIR" ] && [ -f "$FILE" ] && [ -f "$SERVICE" ];then
    echo "${DIR}, ${FILE} and ${SERVICE} already exists! starting runner..."
    cd actions-runner
    sudo ./svc.sh start
else
    export RUNNER_ALLOW_RUNASROOT="1" 
    echo "Files required were not found installing runner..."
    mkdir -p actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.296.2.tar.gz -L $GITURL
    echo "$HASH  actions-runner-linux-x64-2.296.2.tar.gz" | shasum -a 256 -c
    tar xzf ./actions-runner-linux-x64-2.296.2.tar.gz
    ./config.sh --url $ORGURL --token $TOKEN --runnergroup "default" --name "SergioMM"  --work "_work" --labels "SMMRunner"
    sudo ./svc.sh install
    sudo ./svc.sh start
fi