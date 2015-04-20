#!/bin/sh

# this assumes you created the openshift directory in your home directory
 
meteor build builder

cp builder/ride.tar.gz ~/OpenShift/brunocasanova/ride/openshift-builder
rm builder/ride.tar.gz

ls

cd ~/OpenShift/brunocasanova/ride/openshift-builder

ls

tar -xvf ride.tar.gz -s '/^bundle//'
rm ride.tar.gz

git add .

git commit -am "AUTO-DEPLOY"

git push upstream master -f
