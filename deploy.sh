#!/usr/bin/env bash
set -e

cd ~/Sites/qpleple
jekyll build
git add .
git ci -m "Mofif `date +"%y-%m-%d %T"`"
cd ~/Sites/qpleple/_site
git add .
git ci -m "Deploy `date +"%y-%m-%d %T"`"
git push
cd ~/Sites/qpleple
git push