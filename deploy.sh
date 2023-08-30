#!/usr/bin/env bash
set -x

cd /Users/qt/github/qpleple
jekyll build
git add --all .
git ci -m "Modif `date +"%y-%m-%d %T"`"

cd /Users/qt/github/qpleple/_site
git add --all .
git ci -m "Deploy `date +"%y-%m-%d %T"`"
git push

cd /Users/qt/github/qpleple
git push