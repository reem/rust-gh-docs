#!/bin/bash

set -e

USER=$1;
PROJECT=$2;

rev=$(git rev-parse --short HEAD)

cd target/doc

git init
git config --global user.name "doc bot"
git config --global user.email "docbot@travis"
git remote add upstream "https://$GH_TOKEN@github.com/$1/$2"

touch .

git checkout -b gh-pages
git add -A .
git commit -m "rebuild pages at ${rev}"
git push --force --quiet upstream gh-pages

