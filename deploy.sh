#!/usr/bin/env bash
set -e
set -x

cd ~/Sites/qpleple
jekyll build
git add --all .
echo -e "\e[33m"
git ci -m "Mofif `date +"%y-%m-%d %T"`"
echo -e "\e[0m"

cd ~/Sites/qpleple/_site
git add --all .
echo -e "\e[33m"
git ci -m "Deploy `date +"%y-%m-%d %T"`"
echo -e "\e[0m"
git push

cd ~/Sites/qpleple
git push