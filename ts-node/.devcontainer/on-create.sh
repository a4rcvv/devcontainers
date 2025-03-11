# !/bin/bash

# chown volume-mounted dirs
VOLUME_MOUNTED_DIRS="
/workspace/node_modules
/home/node/.npm-global
/home/node/.cache
/home/node/.npm
"
for dir in $VOLUME_MOUNTED_DIRS; do
  if [ -d $dir ]; then
    sudo chown -R node:node $dir
  fi
done

# install project dependencies
if [ -f "package.json" ]; then
  echo "installing project dependencies"
  npm install
  echo "done!"
else
  echo "no package.json file found in /workspace, skipping npm install"
fi