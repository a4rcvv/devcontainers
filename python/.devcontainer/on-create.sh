# !/bin/bash

# chown volume-mounted dirs
VOLUME_MOUNTED_DIRS="
/workspace/.venv
/home/vscode/.cache
"
for dir in $VOLUME_MOUNTED_DIRS; do
  if [ -d $dir ]; then
    sudo chown -R vscode:vscode $dir
  fi
done

# install project dependencies
cd /workspace
echo "creating virtual environment in /workspace/.venv"
uv venv --allow-existing .venv
echo "done!"
if [ -f "uv.lock" ]; then
  echo "installing python dependencies in /workspace/.venv"
  uv sync --frozen --all-extras
  echo "done!"
else
  echo "no uv.lock file found in /workspace, skipping uv sync"
fi