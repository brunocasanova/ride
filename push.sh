#!/bin/sh
# this assumes you created the openshift directory in your home directory
# modify the script if this is not the case
 
BUILDER_PATH="Openshift/brunocasanova/meteordemo/openshift-builder"

meteor build builder
cp builder/meteordemo.tar.gz ~/$BUILDER_PATH
rm builder/meteordemo.tar.gz
cd ~/$BUILDER_PATH

tar -xvf meteordemo.tar.gz -s '/^bundle//'
rm meteordemo.tar.gz

git add .
git commit -am "AUTO-DEPLOY"
git push