#!/usr/bin/env bash
set -x

cd ~/Sites/qpleple
jekyll build
git add --all .
git ci -m "Mofif `date +"%y-%m-%d %T"`"

cd ~/Sites/qpleple/_site
git add --all .
git ci -m "Deploy `date +"%y-%m-%d %T"`"
git push

cd ~/Sites/qpleple
git push