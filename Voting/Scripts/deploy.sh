#!/bin/bash -e

appplicationCount=`sfctl application list | grep VotingApplication | wc -l`
applicationTypeVersion="1.0.0"
if [[ "$#" != "0" && "$1" != "$applicationTypeVersion" ]];then 	
	applicationTypeVersion="$1"
fi
echo "Deploying with ApplicationTypeVersion $applicationTypeVersion"
if [[ "$appplicationCount" -eq "0" ]];then
<<<<<<< HEAD
    /bin/bash  Scripts/install.sh $applicationTypeVersion
=======
    /bin/bash Scripts/install.sh $applicationTypeVersion
>>>>>>> 57a6e4995f9e2321e27cd622fe0c3e14f8a71ef6
    if [[ "$?" -eq "0" ]]; then
    	echo "Successfully deployed application."
	else
		echo "Error occurred while deploying application."
		exit 1 
	fi 
else    
    echo "Application already exists. CleanUp: Undeploying existing app"
    /bin/bash Scripts/uninstall.sh $applicationTypeVersion
    if [[ "$?" -eq "0" ]]; then
    	echo "Successfully uninstalled application. Now re-deploying."
	else 
		echo "Error occurred while uninstalling application."
		exit 1
	fi
    /bin/bash Scripts/install.sh $applicationTypeVersion
    if [[ "$?" -eq "0" ]]; then
    	echo "Successfully deployed application."
	else
		echo "Error occurred while deploying application."
		exit 1 
	fi     
<<<<<<< HEAD
fi
=======
fi
>>>>>>> 57a6e4995f9e2321e27cd622fe0c3e14f8a71ef6
