#!/bin/sh
 
meteor build bundler

cp bundler/app.tar.gz ~/OpenShift/brunocasanova/ride/builder
rm -r bundler

cd ~/OpenShift/brunocasanova/ride/builder

tar -xvf app.tar.gz -s '/^bundle//'
rm app.tar.gz

git add .

git commit -am "AUTO-DEPLOY"

git push origin master -f
