#!/bin/sh
DIR=actions-runner
FILE=actions-runner/svc.sh
GITURL='https://github.com/actions/runner/releases/download/v2.296.2/actions-runner-linux-x64-2.296.2.tar.gz'
HASH='34a8f34956cdacd2156d4c658cce8dd54c5aef316a16bbbc95eb3ca4fd76429a'
ORGURL='https://github.com/devops-bc-01'
TOKEN='AQWL6OVDUXVKA33CB26L77TDFTDR4'

if [ -d "$DIR" ] && [ -f "$FILE" ];then
    echo "${DIR} and ${FILE} already exists! starting runner..."
    cd actions-runner
    sudo ./svc.sh start
else
    echo "Files required were not found installing runner..."
    mkdir -p actions-runner && cd actions-runner
    curl -o actions-runner-linux-x64-2.296.2.tar.gz -L $GITURL
    echo "$HASH  actions-runner-linux-x64-2.296.2.tar.gz" | shasum -a 256 -c
    tar xzf ./actions-runner-linux-x64-2.296.2.tar.gz
    ./config.sh --url $ORGURL --token $TOKEN
    cd actions-runner
    sudo ./svc.sh install
    sudo ./svc.sh start
fi