# !/bin/bash

# chown volume-mounted dirs
VOLUME_MOUNTED_DIRS="
/home/vscode/.gradle
/home/vscode/.cache
"
for dir in $VOLUME_MOUNTED_DIRS; do
  if [ -d $dir ]; then
    sudo chown -R vscode:vscode $dir
  fi
done

# dependency installation
./gradlew --no-daemon dependencies