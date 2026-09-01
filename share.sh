#!/bin/bash
# Rebuild the shareable zip: unzips into one folder, open index.html, works offline.
cd "$(dirname "$0")"
NAME=silt-brand-playbook
rm -rf /tmp/$NAME "$NAME.zip"
mkdir -p /tmp/$NAME
rsync -a --exclude '.git' --exclude '.vercel' --exclude '.DS_Store' --exclude 'share.sh' \
      --exclude '.gitignore' --exclude "$NAME.zip" ./ /tmp/$NAME/
(cd /tmp && zip -rq "$OLDPWD/$NAME.zip" $NAME)
rm -rf /tmp/$NAME
echo "Built $(pwd)/$NAME.zip  ($(du -h $NAME.zip | cut -f1))"
