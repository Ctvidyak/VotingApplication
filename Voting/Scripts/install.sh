#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
appPkgPath="$DIR/../VotingApplication"

if [[ "$#" != "0" ]];then 
	version="$1"
else 
	version="1.0.0"
fi

sfctl application upload --path $appPkgPath
if [ $? -ne 0 ]; then
    echo "Application copy failed."
    exit 1
fi

sfctl application provision --application-type-build-path VotingApplication --no-wait
if [ $? -ne 0 ]; then
    echo "Application type registration failed."
    exit 1
fi

<<<<<<< HEAD
sfctl application create --app-name fabric:/VotingApplication --app-type VotingApplicationType  --app-version $version --timeout 600
=======
sfctl application create --app-name fabric:/VotingApplication --app-type VotingApplicationType  --app-version $version
>>>>>>> 57a6e4995f9e2321e27cd622fe0c3e14f8a71ef6
if [ $? -ne 0 ]; then
    echo "Application creation failed."
    exit 1
fi

echo "Install script executed successfully."
