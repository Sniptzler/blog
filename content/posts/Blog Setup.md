---
title: Blog Setup
date: 2024-12-07
tags:
  - docs
  - blog-setup
  - hugo
  - obsidian
  - firebase
author: Me
description: Hier erkläre ich wie das die Website aufgebaut ist.
weight: "2"
---
Stichpunkte:
- Hugo
- firebase hosting
- Obsidian
- auto deploy

Inspo:
https://blog.networkchuck.com/posts/my-insane-blog-pipeline/

Github:
https://github.com/Sniptzler/blog

Gehostet ist die Website auf Firebase von Google, die haben einen sehr praktischen Free Tier plan ohne Angabe von Zahlungsinformationen für statische Websiten wie diese.
Um die Website zu bauen benutze ich Hugo, dass ist ein Tool das aus Markdown Dateien eine fertige Website zusammenbaut. Es gibt dafür auf deren Website zahlreiche kostenlose Themes die sich sehr einfach verwenden lassen. Die Markdown Dateien schreibe ich in Obsidian.

Orientiert habe ich mich dabei an dem Tutorial von NetworkChuck. Ich schreibe also meine Blog Posts in Obsidian und aus Obsidian starte ich ein kleines Script dass die Dateien in mein Hugo Projekt kopiert, die Hugo Website baut, auf Github hochlädt und dann auf Firebase hostet.

**deploy.sh**
```
#!/bin/bash

cd /home/lukas/Dokumente/blog

rsync -av /home/lukas/Dokumente/Obsidian-Notes/posts/ /home/lukas/Dokumente/blog/content/posts/

hugo

git add .

git commit -m "deploy: run deploy script"

git pull

git push

firebase deploy
```
(Natürlich nicht vergessen das Script ausfürbar zu machen)
```
sudo chmod +x deploy.sh
```


Damit das funktioniert muss man rsync, hugo, und firebase-cli installirt haben. Als erstes erstellt man ein neues Hugo Projekt.
```
hugo new blog
```

Wir erstellen einen Ordner im Hugo Projekt in den wir unsere Posts synchronisieren.
```
cd blog
mkdir content/posts
```

Mit rsync synchronisieren wir die Markdown Dateien aus Obsidian zum Hugo Projekt.
```
rsync -av "obsidian directory" "blog/content/posts"
```

Mit ```firebase init``` erstellen wir das Firebase Projekt. Dafür meldet man sich mit seinem Google Account an und erstellt dann ein neues Projekt. Außerdem wählt man den Ordner aus in  dem sich die index.html befindet. Standarmäßig sollte das der public ordner sein. Im nachinein lässt sich das firebase.json einstellen.

Mit ```hugo build ``` wir die Website generiert.

Danach kann man mit ```firebase deploy ```die Website deployen, die Website ist danach auf der angezeigten URL verfügbar.

Damit die Website nicht so langweilig aussieht sucht man sich noch ein passendes Theme aus und fügt das wie dort beschrieben zu seinem Projekt hinzu.

Optional kann man das ganze Projekt auch noch mit git versionieren und auf Github hochladen, dann können andere Personen Änderungen vorschlagen und auf Rechtschreibfehler hinweisen.

Wenn man seine Posts mit Obsidian schreibt kann mein von den vielen Erweiterungen gebrauch machen und zum Biespiel mit der Shell commands Erweiterung das script automatisch aus Obsidian heraus ausführen.