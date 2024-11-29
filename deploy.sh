#!/bin/bash

cd /home/lukas/Dokumente/blog

rsync -av /home/lukas/Dokumente/Obsidian-Notes/posts/ /home/lukas/Dokumente/blog/content/posts/

hugo

git add .

git commit -m "deploy: run deploy script"

git pull

git push

firebase deploy
