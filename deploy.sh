#!/bin/bash


rsync -av /home/lukas/Dokumente/Obsidian-Notes/posts/ /home/lukas/Dokumente/blog/content/posts/

hugo

git add .

git commit -m "deploy: run deploy script"

git push

firebase deploy
