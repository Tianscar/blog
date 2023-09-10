#!/usr/bin/env sh

git add .
git commit -m "Site updated: $(date "+%Y-%m-%d %H:%M:%S")"
git pull origin main
git push origin main

npx hexo clean && npx hexo generate

cd public
git init
git add .
git commit -m "Site updated: $(date "+%Y-%m-%d %H:%M:%S")"
git push -u git@github.com:Tianscar/blog.git origin gh-pages --force
