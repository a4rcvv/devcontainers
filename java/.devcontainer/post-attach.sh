#!/bin/bash

git config --global --add safe.directory /workspace

# install if git repo is initialized
if [ -d .git ]; then
  lefthook install
else
  echo "Git repo is not initialized. Skipping to install git hooks."
fi